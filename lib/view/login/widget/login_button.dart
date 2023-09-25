import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final VoidCallback? onPressed;

  const LoginButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 0.0,
        color: ColorUtil.blue,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: const Text(
            "Login",
            style: TextStyleUtil.textButtonLogin,
          ),
        ),
      ),
    );
  }
}