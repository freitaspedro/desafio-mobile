import 'package:flutter/material.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/model/location.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = '/details';

  final Location? location;

  const DetailsScreen({super.key, this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtil.green),
        centerTitle: true,
        title: const Text(
          "Imagens",
          style: TextStyleUtil.textAppBar,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Text(
              location!.videoInfo.title,
              style: TextStyleUtil.titleDetails,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                location!.videoInfo.subtitle,
                style: TextStyleUtil.subtitleDetails,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 190.0,
              height: 190.0,
              child: Image.asset('assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
