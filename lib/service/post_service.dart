import 'dart:convert';

import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:http/http.dart' as http;

class PlaceService {
  String baseUrl = 'http://10.0.2.2:8000/api/mobile';

  Future<List<PlacesModel>> getPlace() async {
    var headers = {
      'Content-Type': 'application/json',
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };
    var url = '$baseUrl/places';

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<PlacesModel> places = [];

      for (var item in data) {
        places.add(PlacesModel.fromJson(item));
      }

      return places;
    } else {
      throw Exception('Gagal get Places!');
    }
  }
}
