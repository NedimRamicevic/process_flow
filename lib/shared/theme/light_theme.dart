import 'package:flutter/material.dart';

class LighTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LighTheme() {
    theme = ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white70,
        appBarTheme: AppBarTheme(
            color: _lightColor.blueMenia,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)))),
        //scaffoldBackgroundColor: _lightColor.blueMenia,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _lightColor.blueMenia),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onPrimary: Colors.white70,
                onSecondary: _lightColor.blueMenia,
                onError: _lightColor.redHot)),
        colorScheme: const ColorScheme.light().copyWith(
            onPrimary: Colors.white70,
            background: _lightColor.blueMenia,
            onError: _lightColor.redHot),
        cardTheme: CardTheme(color: _lightColor.blueMenia),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: const BorderSide(color: Colors.green)),
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(250, 6, 4, 4);
  final Color blueMenia = const Color.fromRGBO(95, 188, 248, 1);
  final Color redHot = const Color.fromRGBO(219, 0, 55, 1);
}
