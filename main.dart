import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nutri_glow/firebase_options.dart';
import 'frontend/lib/cubit/password_visible_cubit.dart';
import 'frontend/lib/features/authentication/auth_first_screen.dart';
import 'frontend/lib/features/authentication/sign_in.dart';
import 'frontend/lib/features/authentication/sign_up.dart';
import 'frontend/lib/features/onboarding/onboarding_first.dart';
import 'frontend/lib/features/onboarding/onboarding_screen.dart';
import 'frontend/lib/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          GoRoute(
              path: 'Home_Main',
              builder: ((context, state) => const MySwipeScreen())),
        ],
      ),
    ],
  );
}
