import 'package:desafio_mobile/view/details/details_screen.dart';
import 'package:desafio_mobile/view/home/home_screen.dart';
import 'package:desafio_mobile/view/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => const LoginScreen(),
        HomeScreen.id : (context) => const HomeScreen(),
        DetailsScreen.id : (context) => const DetailsScreen(),
      },
    );
  }
}
