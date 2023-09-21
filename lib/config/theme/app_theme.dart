import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.pinkAccent,
  Colors.orangeAccent,
  Colors.tealAccent,
  Colors.yellowAccent,
  Colors.deepPurpleAccent,
];

class AppTheme {
  final int selectedColor;  
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
    }): assert(selectedColor >=0,'selectedColor must be > 0'),
        assert(selectedColor < colorList.length,'selectedColor must be <= ${colorList.length}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme:const AppBarTheme(
      centerTitle: false,
    )
  );
}