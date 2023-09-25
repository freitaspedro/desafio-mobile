import 'package:desafio_mobile/view/home/widget/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:desafio_mobile/view/home/widget/location_item.dart';
import 'package:desafio_mobile/model/location.dart';
import 'package:desafio_mobile/view/commons/widget/progress.dart';


class LocationList extends StatefulWidget {
  final List<Location> listLocation;
  final bool error;
  final VoidCallback? onTryAgain;

  const LocationList({super.key, required this.listLocation, required this.error, this.onTryAgain});

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: widget.listLocation.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.listLocation.length) {
          return widget.error ?
            EmptyList(onTryAgain: widget.onTryAgain) : const Progress();
        }
        return LocationItem(location: widget.listLocation.elementAt(index));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1.0);
      },
    );
  }
}
