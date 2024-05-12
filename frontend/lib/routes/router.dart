import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication/auth_first_screen.dart';
import '../features/authentication/sign_up.dart';

class Router extends StatelessWidget {
  Router({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Router",
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: '/', builder: ((context, state) => const AuthScreen())),
      GoRoute(path: '/sign_up', builder: ((context, state) => const SignUp())),
    ],
  );
}
