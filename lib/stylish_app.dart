import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/core/utils/app_routs.dart';

import 'generated/l10n.dart';

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppSettingsNotifier(),

      child: Consumer<AppSettingsNotifier>(
        builder: (context, value, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: value.locale,
            routerConfig: AppRoutes.router,
            themeMode: value.themeMode,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}
