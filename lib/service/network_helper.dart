import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future<Map<String, dynamic>?>? getData() async {
    final uri = Uri.parse(url);
    const timeoutDuration = Duration(milliseconds: 10000);
    try {
      if (kDebugMode) {
        print('Requesting..');
      }
      http.Response response = await http.get(uri).timeout(timeoutDuration);
      switch (response.statusCode) {
        case 202:
          if (kDebugMode) {
            print('Request successful - 202');
          }
          return convert.jsonDecode(response.body);
        case 400:
          if (kDebugMode) {
            print('Bad request - 400');
            print(getMessageFromResponse(convert.jsonDecode(response.body)));
          }
          return null;
        case 500:
          if (kDebugMode) {
            print('Internal server error - 500');
            print(getMessageFromResponse(convert.jsonDecode(response.body)));
          }
          return null;
        default:
          if (kDebugMode) {
            print('Request failed with status: ${response.statusCode}');
          }
          return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Request error: $e');
      }
      return null;
    }
  }

  String getMessageFromResponse(Map<String, dynamic>? body) {
    String message = "Generic error.";
    if (body != null && body.containsKey('status')) {
      final status = body['status'];
      if (status is Map<String, dynamic> && status.containsKey('message')) {
        message = status['message'];
      }
    }
    return message;
  }

}