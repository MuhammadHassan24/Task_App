import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
ThemeData lightTheme = ThemeData(brightness: Brightness.light);

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;
  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
