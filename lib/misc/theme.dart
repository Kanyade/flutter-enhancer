import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  /// Shortcut to access ThemeData
  ThemeData get theme => Theme.of(this);

  /// Shortcut to access TextTheme
  TextTheme get textTheme => theme.textTheme;

  /// Shortcut to access PrimaryTextTheme
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// Shortcut to access BottomAppBarThemeData
  BottomAppBarThemeData get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// Shortcut to access BottomSheetThemeData
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// Shortcut to access AppBarThemeData
  AppBarThemeData get appBarTheme => theme.appBarTheme;

  /// Shortcut to access ColorScheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Shortcut to access backgroundColor
  Color get backgroundColor => theme.colorScheme.surface;

  /// Shortcut to access primaryColor
  Color get primaryColor => theme.primaryColor;

  /// Shortcut to access primaryColorLight
  Color get primaryColorLight => theme.primaryColorLight;

  /// Shortcut to access primaryColorDark
  Color get primaryColorDark => theme.primaryColorDark;

  /// Shortcut to access focusColor
  Color get focusColor => theme.focusColor;

  /// Shortcut to access hoverColor
  Color get hoverColor => theme.hoverColor;

  /// Shortcut to access scaffoldBackgroundColor
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Shortcut to access dividerColor
  Color get dividerColor => theme.dividerColor;
}
