import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';

class SearchModel extends SearchEntity {
  String? id;
  String? name;
  String? description;
  String? img;
  int? price;
  String? categoryId;
  dynamic category;
  List<dynamic>? images;
  List<dynamic>? reviews;

  SearchModel({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.price,
    this.categoryId,
    this.category,
    this.images,
    this.reviews,
  }) : super(
    productId: id ?? '',
    productName: name ?? '',
    productDescription: description ?? '',
    productPrice: price?.toDouble() ?? 0.0,
    productImage: img ?? '',
  );

  SearchModel.fromJson(Map<String, dynamic> json)
      : super(
    productId: json["Id"] ?? '',
    productName: json["Name"] ?? '',
    productDescription: json["Description"] ?? '',
    productPrice: (json["Price"] as num?)?.toDouble() ?? 0.0,
    productImage: json["Img"] ?? '',
  ) {
    categoryId = json["CategoryId"];
    category = json["Category"];
    images = json["Images"] ?? [];
    reviews = json["Reviews"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Name"] = name;
    data["Description"] = description;
    data["Img"] = img;
    data["Price"] = price;
    data["CategoryId"] = categoryId;
    data["Category"] = category;
    if (images != null) {
      data["Images"] = images;
    }
    if (reviews != null) {
      data["Reviews"] = reviews;
    }
    return data;
  }
}
