import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cubit/password_visible_cubit.dart';
import 'features/authentication/auth_first_screen.dart';
import 'features/authentication/sign_in.dart';
import 'features/authentication/sign_up.dart';
import 'features/onboarding/onboarding_first.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(NutriGlowApp());
}

class NutriGlowApp extends StatelessWidget {
  NutriGlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibleCubit(),
      child: MaterialApp.router(
        title: 'NutriGlow',
        routerConfig: _router,
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: ((context, state) => const AuthScreen()),
        routes: [
          GoRoute(
            path: 'sign_up',
            builder: ((context, state) => const SignUp()),
          ),
          GoRoute(
            path: 'sign_in',
            builder: ((context, state) => const SignIn()),
          ),
          GoRoute(
            path: 'onboarding',
            builder: ((context, state) => const OnboardingFirstScreen()),
          ),
          GoRoute(
              path: 'onboarding_main',
              builder: ((context, state) => const OnboardingMainScreen())),
        ],
      ),
    ],
  );
}
