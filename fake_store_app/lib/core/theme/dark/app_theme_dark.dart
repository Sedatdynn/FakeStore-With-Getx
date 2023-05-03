import 'package:flutter/material.dart';

import '../theme.dart';
import 'dark_theme.dart';

class AppThemeDark extends AppTheme with IThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        textTheme: ThemeData.light().textTheme.apply(),
        primaryTextTheme: ThemeData.light().textTheme.apply(),
        colorScheme: _colorScheme,
        appBarTheme: _appBarTheme,
        tabBarTheme: _tabBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        textSelectionTheme: _textSelectionTheme,
        textButtonTheme: _textButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        scaffoldBackgroundColor: colorSchemeDark!.shark,
        cardColor: _colorScheme.primary,
      );

  ColorScheme get _colorScheme => ColorScheme(
        brightness: colorSchemeDark!.brightnessDark,
        primary: colorSchemeDark!.codGray,
        onPrimary: colorSchemeDark!.alto,
        secondary: colorSchemeDark!.mineShaft,
        onSecondary: colorSchemeDark!.hitGray,
        error: colorSchemeDark!.alizarinCrimson,
        onError: colorSchemeDark!.mineShaft,
        background: colorSchemeDark!.alto,
        onBackground: colorSchemeDark!.silverSand,
        surface: colorSchemeDark!.shark,
        onSurface: colorSchemeDark!.hitGray,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: colorSchemeDark!.transparent,
        systemOverlayStyle: colorSchemeDark!.systemOverlayStyle,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: _colorScheme.background),
      );

  TabBarTheme get _tabBarTheme => TabBarTheme(
        labelColor: _colorScheme.background,
        unselectedLabelColor: _colorScheme.onSecondary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.0,
            color: _colorScheme.background,
          ),
        ),
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        fillColor: colorSchemeDark!.mineShaft,
      );

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colorScheme.background,
        selectionColor: _colorScheme.onSecondary,
        selectionHandleColor: _colorScheme.background,
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: colorSchemeDark!.transparent,
        backgroundColor: _colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2,
      ));

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: colorSchemeDark!.transparent,
        foregroundColor: _colorScheme.background,
        shadowColor: _colorScheme.primary,
        elevation: 0,
      ));
}
