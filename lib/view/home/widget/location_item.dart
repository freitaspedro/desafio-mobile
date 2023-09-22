import 'package:flutter/material.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/details/details_screen.dart';
import 'package:desafio_mobile/model/location.dart';

class LocationItem extends StatefulWidget {
  final Location? location;

  const LocationItem({super.key, this.location});

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.location!.locationInfo.name,
                style: TextStyleUtil.titleList,
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.location!.locationInfo.address.address,
                style: TextStyleUtil.subtitleList,
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                navigateToDetails();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorUtil.green,
              )
          ),
        ],
      ),
    );
  }

  void navigateToDetails() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailsScreen(location: widget.location)
        )
    );
  }

}
