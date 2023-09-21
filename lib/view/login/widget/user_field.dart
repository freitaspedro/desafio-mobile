import 'package:flutter/material.dart';
import 'package:desafio_mobile/utils/color_util.dart';

class UserField extends StatelessWidget {

  final TextEditingController? controller;

  const UserField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0),
        width: 360.0,
        height: 56.0,
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.green, width: 1.4),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: ColorUtil.offwhite,
        ),
        child: TextFormField(
          controller: controller,
          autofocus: false,
          decoration: const InputDecoration(
              focusColor: Colors.transparent,
              hintText: "Usuário",
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}