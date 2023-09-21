import 'package:flutter/material.dart';
import 'package:desafio_mobile/view/splash/splash_screen.dart';
import 'package:desafio_mobile/view/details/details_screen.dart';
import 'package:desafio_mobile/view/home/home_screen.dart';
import 'package:desafio_mobile/view/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route : (context) => const SplashScreen(),
        LoginScreen.route : (context) => const LoginScreen(),
        HomeScreen.route : (context) => const HomeScreen(),
        DetailsScreen.route : (context) => const DetailsScreen(),
      },
    );
  }
}
