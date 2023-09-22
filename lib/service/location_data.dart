import 'package:desafio_mobile/model/location.dart';
import 'package:desafio_mobile/utils/mock.dart';

class LocationData {

  List<Location>? listLocation = Mock.listLocationMocked;

  Future<List<Location>?> getData() async {
    return listLocation;
  }

}