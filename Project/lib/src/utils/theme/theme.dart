import 'package:flutter/material.dart';
import 'package:project/src/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:project/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:project/src/utils/theme/widget_theme/text_theme.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutLinedButtomTheme.lightOutLinedButtomTheme,
    elevatedButtonTheme: TElevatedButtomTheme.lightElevatedButtomTheme,
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
  outlinedButtonTheme: TOutLinedButtomTheme.darktOutLinedButtomTheme,
    elevatedButtonTheme: TElevatedButtomTheme.darktElevatedButtomTheme,
  );
}

