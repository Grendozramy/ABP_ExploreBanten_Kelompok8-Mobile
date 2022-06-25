import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:explore_banten_mobile/service/category_service.dart';
import 'package:flutter/material.dart';

class KategoriProvider with ChangeNotifier {
  static List<KategoriModel> _kategoris = [];
  static List<KategoriModel> get kategoris => _kategoris;

  set kategori(List<KategoriModel> kategori) {
    _kategoris = kategori;
    notifyListeners();
  }

  Future<void> getKategori() async {
    try {
      List<KategoriModel> kategori = await KategoriService().getKategori();
      _kategoris = kategori;
    } catch (e) {
      print(e);
    }
  }
}
