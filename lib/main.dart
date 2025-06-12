import 'package:flutter/material.dart';
import 'package:stylish/utils/app_routs.dart';

void main(List<String> args) {
  runApp(const StylishApp());
}

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoutes.router);
  }
}
