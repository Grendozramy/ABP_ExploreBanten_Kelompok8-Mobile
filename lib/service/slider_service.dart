import 'dart:convert';

import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:explore_banten_mobile/models/sliders_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class SliderService {
  String baseUrl = 'http://10.0.2.2:8000/api/mobile';

  Future<List<SliderModel>> getSliders() async {
    var headers = {
      'Content-Type': 'application/json',
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };
    var url = '$baseUrl/sliders';

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<SliderModel> slider = [];

      for (var item in data) {
        slider.add(SliderModel.fromJson(item));
      }

      return slider;
    } else {
      throw Exception('Gagal get slider!');
    }
  }
}
