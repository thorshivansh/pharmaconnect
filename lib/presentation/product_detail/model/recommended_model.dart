class RecommendedModel {
  String? allotedUnits;
  String? imagePath;
  String? productName;
  String? id;
  int? colorCode;

  RecommendedModel(
      {this.allotedUnits,
      this.imagePath,
      this.productName,
      this.id,
      this.colorCode});

  factory RecommendedModel.fromJson(Map<String, dynamic> json) {
    return RecommendedModel(
      allotedUnits: json['allotedUnits'],
      imagePath: json['imagePath'],
      productName: json['productName'],
      id: json['id'],
    );
  }
}
