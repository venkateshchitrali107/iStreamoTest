import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static Color _iconColor = Colors.white24;
  static const Color _lightPrimaryColor = Color.fromARGB(255, 5, 105, 151);
  static const Color _lightPrimaryVariantColor = Color(0xFF33678A);
  static const Color _lightSecondaryColor = Colors.white24;
  static const Color _lightOnPrimaryColor = Color(0XFFEAEFF3);

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: _lightPrimaryColor,
        fontFamily: "Merriweather",
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      color: _lightPrimaryColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
      onSecondary: _lightPrimaryVariantColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _lightTextTheme,
    scaffoldBackgroundColor: _lightOnPrimaryColor,
    dividerTheme: DividerThemeData(
      color: Colors.black12,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkOnPrimaryColor,
        background: Colors.white12,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      textTheme: _darkTextTheme,
      dividerTheme: DividerThemeData(color: Colors.black));

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightScreenHeading1TextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkScreenHeading1TextStyle,
  );

  static final TextStyle _lightScreenHeading1TextStyle = TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: _lightOnPrimaryColor,
      fontFamily: "Roboto");

  static final TextStyle _darkScreenHeading1TextStyle =
      _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);
}
