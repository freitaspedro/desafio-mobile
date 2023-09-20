import 'package:desafio_mobile/view/login/widget/login_button.dart';
import 'package:desafio_mobile/view/login/widget/password_field.dart';
import 'package:desafio_mobile/view/login/widget/user_field.dart';
import 'package:flutter/material.dart';
import '../../utils/text_style_util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.asset('assets/images/logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Bem-vindo",
                style: TextStyleUtil.titleLogin,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                "Para começar digite seu usuário e senha",
                style: TextStyleUtil.subtitleLogin,
              ),
            ),
            const UserField(),
            const PasswordField(),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}