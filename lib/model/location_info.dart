// To parse this JSON data, do
//
//     final locationInfo = locationInfoFromJson(jsonString);

import 'dart:convert';
import 'package:desafio_mobile/model/address.dart';

LocationInfo locationInfoFromJson(String str) => LocationInfo.fromJson(json.decode(str));

String locationInfoToJson(LocationInfo data) => json.encode(data.toJson());

class LocationInfo {

  String id;
  String name;
  Address address;

  LocationInfo({
    required this.id,
    required this.name,
    required this.address,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
    id: json['id'],
    name: json['name'],
    address: Address.fromJson(json['address']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
  };

}