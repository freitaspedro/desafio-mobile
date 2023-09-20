import 'package:flutter/material.dart';
import '../../../utils/color_util.dart';

class UserField extends StatelessWidget {
  const UserField({super.key});

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
          decoration: InputDecoration(
              focusColor: Colors.transparent,
              hintText: "Usuário",
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}