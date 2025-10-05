// lib/core/utils/network/firebase_notification.dart
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stylish/core/utils/app_routs.dart';

/// Background handler MUST be top-level function.
/// Keep it lightweight; DO NOT use BuildContext here.
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Save the message to local DB if needed — do not call flutter_local_notifications here.
  debugPrint('Background message data: ${message.data}');
  debugPrint('Background message id: ${message.messageId}');
}

class FirebaseNotification {
  FirebaseNotification();

  /// If app opened from terminated/background before router is ready
  /// we store the data here so UI can handle it once router is up.
  static Map<String, dynamic>? pendingNotificationData;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const String channelId = 'high_importance_channel';
  static const String channelName = 'High Importance Notifications';
  static const String channelDescription =
      'Channel for important notifications (Stylish)';

  /// Initialize FCM + local notifications.
  /// Note: pass navigatorKey only if you really need it, but this implementation
  /// relies on AppRoutes.router (GoRouter) for navigation.
  Future<void> init({GlobalKey<NavigatorState>? navigatorKey}) async {
    // AndroidInitializationSettings expects the resource name.
    // Keep '@mipmap/ic_launcher' by default (safe). Replace with your notification icon
    // resource (e.g. 'ic_stat_notify' placed in drawable) for correct small icon.
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosInit = DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    // Initialize plugin and handle taps on local notifications
    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        try {
          final payload = response.payload;
          Map<String, dynamic>? data;
          if (payload != null && payload.isNotEmpty) {
            // payload was set as json string in showLocalNotification
            data = jsonDecode(payload) as Map<String, dynamic>;
          }

          if (data != null) {
            AppRoutes.router.push(AppRoutes.kNotificationScreen, extra: data);
          } else {
            AppRoutes.router.push(AppRoutes.kNotificationScreen);
          }
        } catch (e) {
          debugPrint('Navigation on tap failed: $e');
          // fallback navigate without data
          try {
            AppRoutes.router.push(AppRoutes.kNotificationScreen);
          } catch (_) {
            // if router not ready, keep pending
            pendingNotificationData = null;
          }
        }
      },
    );

    // create Android notification channel (Android 8+)
    final androidPlugin =
        _localNotifications
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    final channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDescription,
      importance: Importance.high,
    );
    await androidPlugin?.createNotificationChannel(channel);

    // register background handler (top-level)
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

    // request permissions
    if (Platform.isIOS) {
      await _messaging.requestPermission(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }

    // foreground messages -> show local notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Foreground message: ${message.messageId}');
      if (message.notification != null) {
        await showLocalNotification(message);
      }
    });

    try {
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        debugPrint(
          'App opened from terminated state via notification: ${initialMessage.messageId}',
        );
        final merged = _mergeMessage(initialMessage);
        try {
          AppRoutes.router.go(AppRoutes.kNotificationScreen, extra: merged);
        } catch (e) {
          debugPrint('Router not ready for initialMessage, saving pending: $e');
          pendingNotificationData = merged;
        }
      }
    } catch (e) {
      debugPrint('getInitialMessage error: $e');
    }
    // When app opened from background by tapping a system notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
        'App opened from background via notification: ${message.messageId}',
      );
      final merged = _mergeMessage(message);
      try {
        AppRoutes.router.go(AppRoutes.kNotificationScreen, extra: merged);
      } catch (e) {
        debugPrint(
          'Router not ready for onMessageOpenedApp, saving pending: $e',
        );
        pendingNotificationData = merged;
      }
    });
  }

  /// Call this from your UI (e.g. in MyApp.initState after router is ready)
  /// to process a pending notification that arrived while router wasn't ready.
  static void handlePendingNotificationIfAny() {
    if (pendingNotificationData != null) {
      try {
        AppRoutes.router.push(
          AppRoutes.kNotificationScreen,
          extra: pendingNotificationData,
        );
      } catch (e) {
        debugPrint('Failed to handle pending notification: $e');
      } finally {
        pendingNotificationData = null;
      }
    }
  }

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');
    return token;
  }

  Map<String, dynamic> _mergeMessage(RemoteMessage message) {
    final Map<String, dynamic> merged = {};
    if (message.notification?.title != null) {
      merged['title'] = message.notification!.title;
    }
    if (message.notification?.body != null) {
      merged['body'] = message.notification!.body;
    }
    merged.addAll(message.data);
    return merged;
  }

  Future<void> showLocalNotification(RemoteMessage message) async {
    // Merge to form payload including title/body and data
    final Map<String, dynamic> payloadMap = _mergeMessage(message);

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher', // change to your small icon if you add one
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await _localNotifications.show(
      id,
      payloadMap['title']?.toString() ?? message.notification?.title,
      payloadMap['body']?.toString() ?? message.notification?.body,
      platformDetails,
      payload: jsonEncode(payloadMap), // <<< important: include title/body here
    );
  }
}
