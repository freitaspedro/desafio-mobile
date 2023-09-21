import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/home/home_screen.dart';
import 'package:desafio_mobile/view/login/widget/login_button.dart';
import 'package:desafio_mobile/view/login/widget/password_field.dart';
import 'package:desafio_mobile/view/login/widget/user_field.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
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
            const Text(
              "Bem-vindo",
              style: TextStyleUtil.titleLogin,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: Text(
                "Para começar digite seu usuário e senha",
                style: TextStyleUtil.subtitleLogin,
              ),
            ),
            UserField(controller: userController),
            PasswordField(controller: passwordController),
            LoginButton(
                onPressed: () {
                  String user = userController.text;
                  String password = passwordController.text;
                  if (isValid(user, password)) {
                    saveUser();
                  } else {
                    ScaffoldMessenger
                        .of(context)
                        .showSnackBar(invalidUserSnackBar());
                  }
                },
            ),
          ],
        ),
      ),
    );
  }

  bool isValid(String user, String password) {
    return (user == "gabriel" && password == "140120");
  }

  SnackBar invalidUserSnackBar() {
    return const SnackBar(
      content: Text(
        'Usuário inválido!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
  }

  Future<void> saveUser() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("isLoggedIn", true);
    navigateToHome();
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.route);
  }

}