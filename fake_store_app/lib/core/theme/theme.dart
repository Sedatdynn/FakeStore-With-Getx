import 'package:flutter/material.dart';

import '../../product/theme/colors.dart';

///  class to define the properties of [ThemeData].
class ITheme {
  const ITheme();

  ThemeData get appTheme => ThemeData(
      primarySwatch: AppColors.primarySwatch,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      iconTheme: _iconTheme);

  AppBarTheme get _appBarTheme => AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      iconTheme: _iconTheme);

  IconThemeData get _iconTheme => const IconThemeData(color: AppColors.button);

  TextTheme get _textTheme => const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
      ));
}
