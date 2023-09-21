// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';
import 'package:desafio_mobile/model/video_info.dart';
import 'package:desafio_mobile/model/location_info.dart';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {

  String uri;
  String fileName;
  VideoInfo videoInfo;
  LocationInfo locationInfo;

  Location({
    required this.uri,
    required this.fileName,
    required this.videoInfo,
    required this.locationInfo,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    uri: json['uri'],
    fileName: json['fileName'],
    videoInfo: VideoInfo.fromJson(json['videoInfo']),
    locationInfo: LocationInfo.fromJson(json['locationInfo']),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "fileName": fileName,
    "videoInfo": videoInfo,
    "locationInfo": locationInfo,
  };

}