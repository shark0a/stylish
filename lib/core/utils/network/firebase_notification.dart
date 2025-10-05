
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
  // Save the message to local DB if needed — do not call local_notifications here.
  debugPrint('Handling a background message ${message.messageId}');
}

class FirebaseNotification {
  FirebaseNotification();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const String channelId = 'high_importance_channel';
  static const String channelName = 'High Importance Notifications';
  static const String channelDescription =
      'Channel for important notifications (Stylish)';

  /// Initialize notification system and FCM handlers.
  Future<void> init({GlobalKey<NavigatorState>? navigatorKey}) async {
    // 1) local notifications initialization
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosInit = DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Tapped local notification payload: ${response.payload}');
        // If you pushed payload as JSON String, parse it.
        try {
          if (navigatorKey != null) {
            // Navigate to notifications screen
            navigatorKey.currentState?.pushNamed('/notifications');
            // Or use GoRouter: AppRoutes.router.go(AppRoutes.kNotificationScreen, extra: parsedData);
          }
        } catch (e) {
          debugPrint('Navigation on tap failed: $e');
        }
      },
    );

    // 2) create Android channel
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

    // 3) register background handler (top-level)
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

    // 4) request permissions
    if (Platform.isIOS) {
      await _messaging.requestPermission(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }

    // 5) foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message: ${message.messageId}');
      if (message.notification != null) {
        showLocalNotification(message);
      }
    });

    // 6) when app opened from terminated state
    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        debugPrint(
          'App opened from terminated state via notification: ${message.messageId}',
        );
        // navigate using router if available
        if (navigatorKey != null) {
          navigatorKey.currentState?.pushNamed(
            '/notifications',
            arguments: message.data,
          );
        } else {
          // fallback: use AppRoutes.router if you imported it
          try {
            AppRoutes.router.go(
              AppRoutes.kNotificationScreen,
              extra: message.data,
            );
          } catch (_) {}
        }
      }
    });

    // 7) when app opened from background by tapping notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint(
        'App opened from background via notification: ${message.messageId}',
      );
      if (navigatorKey != null) {
        navigatorKey.currentState?.pushNamed(
          '/notifications',
          arguments: message.data,
        );
      } else {
        try {
          AppRoutes.router.go(
            AppRoutes.kNotificationScreen,
            extra: message.data,
          );
        } catch (_) {}
      }
    });
  }

  /// get device token
  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');
    return token;
  }

  /// show a local notification from a RemoteMessage (used in onMessage)
  Future<void> showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
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

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      platformDetails,
      payload: message.data.isNotEmpty ? message.data.toString() : null,
    );
  }
}
