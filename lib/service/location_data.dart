import 'package:desafio_mobile/model/address.dart';
import 'package:desafio_mobile/model/location_info.dart';
import 'package:desafio_mobile/model/video_info.dart';
import 'package:desafio_mobile/model/location.dart';

class LocationData {

  List<Location>? listLocation = [
    Location(
      uri: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8", //details
      fileName: "",
      videoInfo: VideoInfo(
        title: "Título do vídeo (1)", // details
        subtitle: "Subtítulo do vídeo (1)", //details
        description: "",
      ),
      locationInfo: LocationInfo(
        id: "",
        name: "Ed. Augusto Arantes", // home
        address: Address(
            city: "",
            state: "",
            address: "R. Marquês de São Vicente 123", //home
            latitude: "",
            longitude: ""
        ),
      ),
    ),
    Location(
      uri: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8", //details
      fileName: "",
      videoInfo: VideoInfo(
        title: "Título do vídeo (2)", //details
        subtitle: "Subtítulo do vídeo (2)", //details
        description: "",
      ),
      locationInfo: LocationInfo(
        id: "",
        name: "Associação dos Amigos", //home
        address: Address(
            city: "",
            state: "",
            address: "Av. Marechal Brigadeiro Almirante Roque Silva 1234", //home
            latitude: "",
            longitude: ""
        ),
      ),
    ),
    Location(
      uri: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8", //details
      fileName: "",
      videoInfo: VideoInfo(
        title: "Título do vídeo (3)", //details
        subtitle: "Subtítulo do vídeo (3)", //details
        description: "",
      ),
      locationInfo: LocationInfo(
        id: "",
        name: "Ed. Carlos Carne", //home
        address: Address(
            city: "",
            state: "",
            address: "Av. Atlântica 3567", //home
            latitude: "",
            longitude: ""
        ),
      ),
    ),
    Location(
      uri: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8", //details
      fileName: "",
      videoInfo: VideoInfo(
        title: "Título do vídeo (4)", //details
        subtitle: "Subtítulo do vídeo (4)", //details
        description: "",
      ),
      locationInfo: LocationInfo(
        id: "",
        name: "Ed. Dante Donatello", //home
        address: Address(
            city: "",
            state: "",
            address: "Travessa dos Macacos 67", //home
            latitude: "",
            longitude: ""
        ),
      ),
    ),
    Location(
      uri: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8", //details
      fileName: "",
      videoInfo: VideoInfo(
        title: "Título do vídeo (5)", //details
        subtitle: "Subtítulo do vídeo (5)", //details
        description: "",
      ),
      locationInfo: LocationInfo(
        id: "",
        name: "Ed. Edson Edmílson", //home
        address: Address(
            city: "",
            state: "",
            address: "R. Santa Ifigênia 644", //home
            latitude: "",
            longitude: ""
        ),
      ),
    ),
  ];

  Future<List<Location>?> getData() async {
    return listLocation;
  }

}