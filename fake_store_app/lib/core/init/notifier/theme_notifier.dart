import 'package:flutter/material.dart';

import '../../../product/enums/theme/theme_mode.dart';
import '../../theme/dark/app_theme_dark.dart';
import '../../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  AppThemes _currentThemeEnum = AppThemes.LIGHT;
  bool themeIcon = false;

  ThemeNotifier() {
    // _loadTheme();
    // changeTheme();
  }

  Future<void> _loadTheme() async {
    // final isDarkTheme =
    //     LocaleManager.instance.getBoolValue(PreferencesKeys.theme);
    // if (isDarkTheme) {
    //   _currentTheme = AppThemeDark.instance.theme;
    //   _currentThemeEnum = AppThemes.DARK;
    // } else {
    //   _currentTheme = AppThemeLight.instance.theme;
    //   _currentThemeEnum = AppThemes.LIGHT;
    // }
    // notifyListeners();
  }

  void changeTheme() {
    print("notifier");
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      // LocaleManager.instance.setBoolValue(PreferencesKeys.theme, true);

      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      // LocaleManager.instance.setBoolValue(PreferencesKeys.theme, false);

      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }

  void changeIcon() {
    themeIcon = !themeIcon;
    notifyListeners();
  }
}
