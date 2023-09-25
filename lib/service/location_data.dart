import 'package:desafio_mobile/model/location.dart';
import 'package:desafio_mobile/service/network_helper.dart';
import 'package:desafio_mobile/utils/mock.dart';

/// Method | URL | Description | Status Code
/// -------|-----|-------------|------------
/// GET    | http://localhost:3001/v1/videos/history            | returns a empty list           | 202-ACCEPT
/// GET    | http://localhost:3001/v1/videos/history?limit=10   | returns a list with 10 items   | 202-ACCEPT
/// GET    | http://localhost:3001/v1/videos/history?limit=20   | returns a list with 20 items   | 202-ACCEPT
/// GET    | http://localhost:3001/v1/videos/history?limit=-1   | returns a not found message    | 400-BAD REQUEST
/// GET    | http://localhost:3001/v1/videos/history?limit=-2   | returns a server error message | 500-INTERNAL SERVER ERROR
///
/// 10.0.2.2
///

const String host = 'localhost';
const String port = '3001';

class LocationData {

  Future<List<Location>?>? getData(int limit) async {
    String url = 'http://$host:$port/v1/videos/history?limit=$limit';
    NetworkHelper networkHelper  = NetworkHelper(url);
    Map<String, dynamic>? result = await networkHelper.getData();
    if (result != null) {
      return List<Location>.from(
          result['data']
              .map((location) => Location.fromJson(location))
              .toList()
      );
    } else {
      return null;
    }
  }

  Future<List<Location>?>? getMockData() async {
    return Mock.listLocationMocked;
  }

}