import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
import 'custom_color.g.dart';

class AppThemeData {
  // static const _lightFillColor = Colors.black;
  // static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData(ColorScheme? dynamic) =>
      themeData(dynamic, lightColorScheme, _lightFocusColor, lightCustomColors);
  static ThemeData darkThemeData(ColorScheme? dynamic) =>
      themeData(dynamic, darkColorScheme, _darkFocusColor, darkCustomColors);

  static ThemeData themeData(ColorScheme? dynamic, ColorScheme colorScheme,
      Color focusColor, CustomColors customColors) {
    if (dynamic != null) {
      colorScheme = dynamic.harmonized();
      customColors = customColors.harmonized(colorScheme);
    }

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: [customColors],
      // textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      // primaryColor: colorScheme.primary,
      // appBarTheme: AppBarTheme(
      //   backgroundColor: colorScheme.background,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: colorScheme.primary),
      //   // titleTextStyle: _textTheme.headline6!.apply(color: colorScheme.primary),
      // ),
      // navigationBarTheme: NavigationBarThemeData(
      //   indicatorColor: Colors.white.withOpacity(0.5),
      //   labelTextStyle: MaterialStateProperty.all(
      //     TextStyle(
      //         fontSize: 12,
      //         fontWeight: FontWeight.bold,
      //         color: colorScheme.onPrimary),
      //   ),
      //   iconTheme: MaterialStateProperty.all(
      //     IconThemeData(
      //       color: colorScheme.onPrimary,
      //     ),
      //   ),
      //   backgroundColor: colorScheme.primary,
      // ),
      // tabBarTheme: TabBarTheme(
      //   labelColor: colorScheme.primary,
      // ),
      // iconTheme: IconThemeData(color: colorScheme.primary),
      // canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      // highlightColor: Colors.transparent,
      // focusColor: focusColor,
      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     _lightFillColor.withOpacity(0.80),
      //     _darkFillColor,
      //   ),
      // contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      // ),
      // backgroundColor: colorScheme.background,
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateProperty.all(
      //     colorScheme.primary,
      //   ),
      //   checkColor: MaterialStateProperty.all(
      //     colorScheme.onPrimary,
      //   ),
      // ),
    );
  }
}
