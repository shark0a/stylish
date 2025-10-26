import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/network/firebase_notification.dart';
import 'package:stylish/firebase_options.dart';
import 'package:stylish/stylish_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final oneSignalService = sl<OneSignalNotificationService>();
  oneSignalService.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const StylishApp());
}
// final notificationService = sl<FirebaseNotification>();
//   await notificationService.init(navigatorKey: AppRoutes.rootNavigatorKey);
//   // final token = await notificationService.getToken();
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize('1efe5393-11b0-40c2-a7c8-4c6f10f203c6');
//   OneSignal.Notifications.requestPermission(true);
//   OneSignal.Notifications.addClickListener((event) {
//     log('--- OneSignal Notification Clicked ---');

//     // Log body and title safely
//     log('Body: ${event.notification.body ?? 'Body is null'}');
//     log('Title: ${event.notification.title ?? 'Title is null'}');

//     // Log category safely
//     log('Category: ${event.notification.category ?? 'Category is null'}');

//     // Log all additional data keys and values safely
//     if (event.notification.additionalData != null &&
//         event.notification.additionalData!.isNotEmpty) {
//       log('Additional Data:');
//       event.notification.additionalData!.forEach((key, value) {
//         log('  $key: $value');
//       });
//     } else {
//       log('Additional Data: is null or empty');
//     }
//   });
