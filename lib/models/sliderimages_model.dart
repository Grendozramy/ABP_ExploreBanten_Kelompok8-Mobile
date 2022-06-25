class Slider1Model {
  late int id;
  late String image;

  Slider1Model({
    required this.id,
    required this.image,
  });

  Slider1Model.fromJson(Map<String, dynamic> json) {
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
