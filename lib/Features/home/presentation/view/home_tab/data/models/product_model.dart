import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  String? categoryId;
  List<Images>? images;
  List<dynamic>? reviews;

  // Constructor
  ProductModel({
    required String id,
    required String name,
    required double price,
    required String description,
    required String img,
    this.categoryId,
    this.images,
    this.reviews,
  }) : super(
    id: id,
    image: img,
    name: name,
    description: description,
    price: price,
  );

  ProductModel.fromJson(Map<String, dynamic> json) : super(
    id: json["Id"] is String ? json["Id"] : '',
    image: json["Img"] is String ? json["Img"] : '',
    name: json["Name"] is String ? json["Name"] : '',
    description: json["Description"] is String ? json["Description"] : '',
    price: json["Price"] is num ? (json["Price"] as num).toDouble() : 0.0,
  ) {
    categoryId = json["CategoryId"] as String?;
    images = json["Images"] == null
        ? []
        : (json["Images"] as List).map((e) => Images.fromJson(e)).toList();
    reviews = json["Reviews"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Name"] = name;
    data["Price"] = price;
    data["Description"] = description;
    data["CategoryId"] = categoryId;
    data["Img"] = image;
    if (images != null && images!.isNotEmpty) {
      data["Images"] = images!.map((e) => e.toJson()).toList();
    }
    if (reviews != null && reviews!.isNotEmpty) {
      data["Reviews"] = reviews;
    }
    return data;
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json["Image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Image"] = image;
    return data;
  }
}
