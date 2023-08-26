import 'package:go_router/go_router.dart';

//Importaciones desde un archivo, mas rapido
import '../../presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      //Path implementation (works like this)
      path: '/',
      //Name implementation (needs static property on Screen)
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

     GoRoute(
      path: '/buttons',
      name: ButtonScreen.name,
      builder: (context, state) => const ButtonScreen(),
    ),

     GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);