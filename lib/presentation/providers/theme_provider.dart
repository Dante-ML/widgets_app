
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//Entero
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

/*
final isDarkModeProvider = NotifierProvider<Toggle, bool>(Toggle.new);

class Toggle extends Notifier<bool>{
  @override
  bool build()=>false;
  bool toggle()=>!state;
}*/