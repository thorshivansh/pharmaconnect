class SliderModel {
  String? imagePath;

  String? id;

  SliderModel({
    this.imagePath,
    this.id,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      imagePath: json['imagePath'],
      id: json['id'],
    );
  }
}
