import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/stylish_app_body.dart';


class StylishApp extends StatelessWidget {
  const StylishApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppSettingsNotifierProvider(),
        ),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: StylishAppBody(),
    );
  }
}
