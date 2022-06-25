import 'package:explore_banten_mobile/models/post_models.dart';

class KategoriModel {
  late int id;
  late String name;
  // late List<PlacesModel> places = <PlacesModel>[];

  KategoriModel({
    required this.id,
    required this.name,
    // required this.places,
  });

  KategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // for (final _places in json["places"]) {
    //   places.add(PlacesModel.fromJson(_places));
    // }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // 'places': places,
    };
  }
}
