import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future<Map<String, dynamic>?>? getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
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