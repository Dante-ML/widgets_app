import 'package:go_router/go_router.dart';

//Importaciones desde un archivo, mas rapido
import '../../presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

     GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonScreen(),
    ),

     GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);