import 'package:bloc_cubit/presentation/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/bloc_screen.dart';
import '../../presentation/screens/cubit_screen.dart';
import '../../presentation/screens/home_screen.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubit-screen',
      name: CubitScreen.name,
      builder: (context, state) => const CubitScreen(),
    ),
    GoRoute(
      path: '/bloc-screen',
      name: BlocScreen.name,
      builder: (context, state) => const BlocScreen(),
    ),
    GoRoute(
      path: '/register-screen',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
