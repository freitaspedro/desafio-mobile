import 'package:flutter/material.dart';
import 'package:desafio_mobile/utils/color_util.dart';

class PasswordField extends StatelessWidget {

  final TextEditingController? controller;

  const PasswordField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0),
        width: 360,
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.green, width: 1.4),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: ColorUtil.offwhite,
        ),
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(
              focusColor: Colors.transparent,
              hintText: "Senha",
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}