import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_util.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToHomeScreen(context);
      },
      child: Container(
        width: 180,
        height: 40,
        decoration: const BoxDecoration(
          color: ColorUtil.blue,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyleUtil.textButtonLogin,
          ),
        ),
      ),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}