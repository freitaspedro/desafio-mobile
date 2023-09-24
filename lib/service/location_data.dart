import 'package:desafio_mobile/model/location.dart';
import 'package:desafio_mobile/service/network_helper.dart';
import 'package:desafio_mobile/utils/mock.dart';


// const apiUrl = 'http://localhost:3001/v1/videos/history?limit=10';              //202 - ACCEPT
const apiUrl = 'http://10.0.2.2:3001/v1/videos/history?limit=10';               //202 - ACCEPT
// const apiUrl = 'http://10.0.2.2:3001/v1/videos/history?limit=20';               //202 - ACCEPT
// const apiUrl = 'http://10.0.2.2:3001/v1/videos/history';                        //202 - ACCEPT
// const apiUrl = 'http://10.0.2.2:3001/v1/videos/history?limit=-1';               //400 - BAD REQUEST
// const apiUrl = 'http://10.0.2.2:3001/v1/videos/history?limit=-2';               //500 - INTERNAL SERVER ERROR

class LocationData {

  List<Location>? listLocation;

  Future<List<Location>?>? getData() async {
    NetworkHelper networkHelper  = NetworkHelper(apiUrl);
    Map<String, dynamic>? result = await networkHelper.getData();
    if (result != null) {
      listLocation = List<Location>.from(
          result['data']
              .map((location) => Location.fromJson(location))
              .toList()
      );
    } else {
      listLocation = null;
    }
    return listLocation;
  }

  List<Location>? mockListLocation;

  Future<List<Location>?>? getMockData() async {
    mockListLocation = Mock.listLocationMocked;
    return mockListLocation;
  }

}