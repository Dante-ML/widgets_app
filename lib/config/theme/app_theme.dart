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

  AppTheme({
    this.selectedColor = 0
    }): assert(selectedColor >=0,'selectedColor must be > 0'),
        assert(selectedColor < colorList.length,'selectedColor must be <= ${colorList.length}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme:const AppBarTheme(
      centerTitle: false,
    )
  );
}