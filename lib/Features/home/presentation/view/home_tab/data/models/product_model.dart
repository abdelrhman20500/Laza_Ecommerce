import '../../domain/entities/product_entity.dart';
import 'image_model.dart';

class ProductModel extends ProductEntity {
  final String? categoryId;
  final List<dynamic>? reviews;

  ProductModel({
    required String id,
    required String name,
    required double price,
    required String description,
    required String img,
    List<Images>? images,
    this.categoryId,
    this.reviews,
  }) : super(
    id: id,
    image: img,
    name: name,
    description: description,
    price: price,
    images: images,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["Id"] is String ? json["Id"] : '',
      name: json["Name"] is String ? json["Name"] : '',
      price: json["Price"] is num ? (json["Price"] as num).toDouble() : 0.0,
      description: json["Description"] is String ? json["Description"] : '',
      img: json["Img"] is String ? json["Img"] : '',
      images: json["Images"] == null
          ? null
          : (json["Images"] as List).map((e) => Images.fromJson(e)).toList(),
      categoryId: json["CategoryId"] as String?,
      reviews: json["Reviews"] ?? [],
    );
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