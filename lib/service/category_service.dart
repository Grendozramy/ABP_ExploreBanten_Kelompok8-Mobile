import 'dart:convert';

import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:http/http.dart' as http;

class KategoriService {
  String baseUrl = 'http://10.0.2.2:8000/api/mobile';

  Future<List<KategoriModel>> getKategori() async {
    var headers = {
      'Content-Type': 'application/json',
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };
    var url = '$baseUrl/categories';

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<KategoriModel> kategori = [];

      for (var item in data) {
        kategori.add(KategoriModel.fromJson(item));
      }

      return kategori;
    } else {
      throw Exception('Gagal get Kategori!');
    }
  }
}
