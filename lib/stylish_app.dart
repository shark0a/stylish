import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/core/utils/app_routs.dart';

import 'generated/l10n.dart';

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

class StylishAppBody extends StatelessWidget {
  const StylishAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<AppSettingsNotifierProvider>().locale,
      routerConfig: AppRoutes.router,
      themeMode: context.watch<AppSettingsNotifierProvider>().themeMode,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark(),
    );
  }
}
