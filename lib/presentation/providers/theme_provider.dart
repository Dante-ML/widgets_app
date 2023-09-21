
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores INMUTABLES
final colorListProvider = Provider((ref) => colorList);

//Bool  Pieza de estado
final isDarkModeProvider = StateProvider((ref) => false);

//Entero
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

//objeto de tipo Apptheme personalizado
//mantener estado de un objeto mas elaborado
//El que controla es el ThemeNotifier y el estado es una instancia de AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
  );

class ThemeNotifier extends StateNotifier<AppTheme>{
  //Creación de la primera instancia de AppTheme, tenemos valores por defecto
  //STATE = Estadp = new AppTheme();
  ThemeNotifier():super(AppTheme());

  void toggleDarkmode(){
    
  }

  void changeColorIndex(int colorIndex){

  }
}

/*
final isDarkModeProvider = NotifierProvider<Toggle, bool>(Toggle.new);

class Toggle extends Notifier<bool>{
  @override
  bool build()=>false;
  bool toggle()=>!state;
}*/