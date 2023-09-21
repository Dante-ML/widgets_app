import '../../presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
//import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(
      //Provider scope es un tipo de widget que mantiene una referencia a todos los providers
      //que usamos
      const ProviderScope(
        child: MainApp()
      )
    );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //bool isDarkMode = ref.watch(isDarkModeProvider);
    //int selectedColor = ref.watch(selectedIndexColorProvider);

    //appTheme nos permite utilizar los valores de nuestra clase app_theme
    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //Ojo el que gobierna el tema ahora es el themeNotifierProvider
      theme: appTheme.getTheme()
      //Como seria antes:
      //AppTheme(selectedColor: appTheme.selectedColor, isDarkMode: appTheme.isDarkMode).getTheme(),

    );
  }
}
