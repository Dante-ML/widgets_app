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

  //Metodo que crea una nueva instancia del AppTheme
  //OJO con las {} 
  AppTheme copyWith({
      //En esta instancia tnemos las variables de selectedColor y isDarkmode pero como opcionales
      //Pueden o no llegarnos un cambio
      int? selectedColor,
      bool? isDarkMode,
    }) => AppTheme(
    //En caso de que no nos lleguen estas nuevas variables entonces usamos los valores de la instancia
    //pasada
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}