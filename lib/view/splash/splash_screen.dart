import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/view/home/home_screen.dart';
import 'package:desafio_mobile/view/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    isLogged();
  }

  void isLogged() async {
    SharedPreferences prefs = await _prefs;
    bool? isLogged = prefs.getBool('isLoggedIn') ?? false;
    Timer(const Duration(milliseconds: 3000), () {
      navigate(isLogged);
    });
  }

  void navigate(bool isLogged) {
    if (isLogged) {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 130.0,
              height: 130.0,
              child: Image.asset('assets/images/logo.png'),
            ),
          ]
        ),
      ),
    );
  }

}
