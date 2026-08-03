import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String kIsDarkModeKey = 'isDarkMode';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_getInitialThemeMode());

  static ThemeMode _getInitialThemeMode() {
    var isDarkMode = Prefs.getBool(kIsDarkModeKey);
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode => state == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    Prefs.setBool(kIsDarkModeKey, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
