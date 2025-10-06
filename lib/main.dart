// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/network/firebase_notification.dart';
import 'package:stylish/firebase_options.dart';
import 'package:stylish/stylish_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final notificationService = sl<FirebaseNotification>();
  await notificationService.init(navigatorKey: AppRoutes.rootNavigatorKey);
  // final token = await notificationService.getToken();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('1efe5393-11b0-40c2-a7c8-4c6f10f203c6');
  OneSignal.Notifications.requestPermission(true);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const StylishApp());
}
