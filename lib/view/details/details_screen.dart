import 'package:flutter/material.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/utils/color_util.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = '/details';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtil.blue),
        centerTitle: true,
        title: const Text(
          "Imagens",
          style: TextStyleUtil.textAppBar,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
