// To parse this JSON data, do
//
//     final videoInfo = videoInfoFromJson(jsonString);

import 'dart:convert';

VideoInfo videoInfoFromJson(String str) => VideoInfo.fromJson(json.decode(str));

String videoInfoToJson(VideoInfo data) => json.encode(data.toJson());

class VideoInfo {

  String title;
  String subtitle;
  String description;

  VideoInfo({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
    title: json['title'],
    subtitle: json['subtitle'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "description": description,
  };

}