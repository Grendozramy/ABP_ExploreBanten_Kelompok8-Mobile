import 'package:explore_banten_mobile/models/category_models.dart';
import 'package:explore_banten_mobile/models/images_model.dart';

class PlacesModel {
  late int id;
  late int category_id;
  late String title;
  late String slug;
  late String title1;
  late KategoriModel category;
  late String description;
  late String phone;
  late String website;
  // ignore: non_constant_identifier_names
  late String office_hours;
  late String address;
  late String address1;
  late double latitude;
  late double longitude;
  late String location;
  late List<ImagesModel> images;

  PlacesModel({
    required this.id,
    required this.category_id,
    required this.title,
    required this.slug,
    required this.title1,
    required this.category,
    required this.description,
    required this.phone,
    required this.website,
    // ignore: non_constant_identifier_names
    required this.office_hours,
    required this.address,
    required this.address1,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.images,
  });

  PlacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_id = json['category_id'];
    title = json['title'];
    title1 = json['title1'];
    slug = json['slug'];
    category = KategoriModel.fromJson(json['category']);
    description = json['description'];
    phone = json['phone'];
    website = json['website'];
    office_hours = json['office_hours'];
    address = json['address'];
    address1 = json['address1'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    images = json['images']
        .map<ImagesModel>((image) => ImagesModel.fromJson(image))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'category_id': category_id,
      'title': title,
      'title1': title1,
      'category': category.toJson(),
      'description': description,
      'phone': phone,
      'website': website,
      'office_hours': office_hours,
      'address': address,
      'address1': address1,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}
