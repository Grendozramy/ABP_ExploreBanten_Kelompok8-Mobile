class ImagesModel {
  late int id;
  late String image;

  ImagesModel({
    required this.id,
    required this.image,
  });

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
