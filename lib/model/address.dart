// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {

  String city;
  String state;
  String address;
  String latitude;
  String longitude;

  Address({
    required this.city,
    required this.state,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json['city'],
    state: json['state'],
    address: json['address'],
    latitude: json['latitude'],
    longitude: json['longitude'],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };

}