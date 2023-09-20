import 'package:flutter/material.dart';
import '../../../utils/color_util.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: 360,
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.green, width: 1.4),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: ColorUtil.offwhite,
        ),
        child: const TextField(
          autofocus: false,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
              focusColor: Colors.transparent,
              hintText: "Senha",
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}