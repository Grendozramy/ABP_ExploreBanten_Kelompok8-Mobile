import 'package:explore_banten_mobile/models/post_models.dart';
import 'package:explore_banten_mobile/service/post_service.dart';
import 'package:flutter/material.dart';

class PlacesProvider with ChangeNotifier {
  static List<PlacesModel> _places = [];
  static List<PlacesModel> get places => _places;

  set place(List<PlacesModel> place) {
    _places = place;
    notifyListeners();
  }

  Future<void> getPlace() async {
    try {
      List<PlacesModel> place = await PlaceService().getPlace();
      _places = place;
    } catch (e) {
      print(e);
    }
  }

  // List<PlacesModel> findByCategory(String categoryName) {
  //   List<PlacesModel> _categoryList = _places
  //       .where((element) => element.category.name
  //           .toLowerCase()
  //           .contains(categoryName.toLowerCase()))
  //       .toList();
  //   return _categoryList;
  // }
}
