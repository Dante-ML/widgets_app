import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String name = "theme_changer_screen";
  
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode == true ? Icons.dark_mode_outlined :Icons.light_mode_outlined),
            onPressed: (){
              //ref.watch(isDarkModeProvider.notifier).update(
                //(isDarkMode) => !isDarkMode);
              
              //Con stateNotifier nosotros somos los que vamos a tener que crear nuestro Notifier
              //Necesitamos el .notifier para acceder a los metodos del notifier mismo, aka toggleDarkmode
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color',style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          enableFeedback: true,
          value: index, 
          groupValue: selectedColor,
          onChanged: (value) {
            //value = index lo elegiste al principio :P
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
          );
      },
    );
  }
}