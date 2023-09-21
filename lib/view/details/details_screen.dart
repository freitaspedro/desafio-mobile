import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
