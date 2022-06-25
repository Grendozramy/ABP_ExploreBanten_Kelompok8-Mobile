import 'package:explore_banten_mobile/models/sliderimages_model.dart';
import 'package:flutter/src/widgets/container.dart';

class SliderModel {
  late int id;
  late List<Slider1Model> images;
  late String title;
  late String title2;

  SliderModel({
    required this.id,
    required this.images,
    required this.title,
    required this.title2,
  });

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images']
        .map<Slider1Model>((image) => Slider1Model.fromJson(image))
        .toList();
    title = json['title'];
    title2 = json['title2'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'title2': title2,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}
