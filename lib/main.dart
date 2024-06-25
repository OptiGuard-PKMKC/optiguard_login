import 'package:flutter/material.dart';
import 'package:optiguard/pages/home_page.dart';
import 'package:optiguard/pages/register_page.dart';
import 'package:optiguard/pages/role_selection.dart';
import 'package:optiguard/pages/splash_page.dart';
import 'package:optiguard/pages/onboarding_page.dart';
import 'package:optiguard/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OptiGuard',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/registerCont': (context) => RegisterPage(),
        '/role': (context) => const RoleSelection(),
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),
      },
      home: const SplashPage(),
    );
  }
}
