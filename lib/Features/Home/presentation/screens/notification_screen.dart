// lib/Features/Home/presentation/screens/notification_screen.dart
import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  final Map<String, dynamic>? notificationData;
  const NotificationScreen({super.key, this.notificationData});

  @override
  Widget build(BuildContext context) {
    final title =
        notificationData?['title'] ??
        notificationData?['notification']?['title'] ??
        'No title';
    final body =
        notificationData?['body'] ??
        notificationData?['notification']?['body'] ??
        'No content';

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification", style: AppStyles.light12),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: AppStyles.secondaryTextgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toString(),
                style: AppStyles.regular12.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                body.toString(),
                style: AppStyles.regular12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
