import 'package:flutter/material.dart';

class AppSettingsNotifier extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  ThemeMode _themeMode = ThemeMode.light;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  void toggleLocale() {
    _locale =
        _locale.languageCode == 'en'
            ? const Locale('ar', 'EG')
            : const Locale('en', 'US');
    notifyListeners();
  }
  

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
