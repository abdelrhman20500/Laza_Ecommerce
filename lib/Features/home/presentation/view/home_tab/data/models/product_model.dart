import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  String? id;
  String? name;
  double? price;
  String? description;
  String? categoryId;
  String? img;
  List<Images>? images;
  List<dynamic>? reviews;

  // تأكد من تمرير جميع المعلمات المطلوبة إلى super
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryId,
    this.img,
    this.images,
    this.reviews,
  }) : super(
    id: id ?? '', // تمرير قيمة افتراضية إذا كانت null
    image: img ?? '', // تمرير قيمة افتراضية إذا كانت null
    name: name ?? '', // تمرير قيمة افتراضية إذا كانت null
    description: description ?? '', // تمرير قيمة افتراضية إذا كانت null
    price: price ?? 0.0, // تمرير قيمة افتراضية إذا كانت null
  );

  ProductModel.fromJson(Map<String, dynamic> json) : super(
    id: json["Id"] is String ? json["Id"] : '',
    image: json["Img"] is String ? json["Img"] : '',
    name: json["Name"] is String ? json["Name"] : '',
    description: json["Description"] is String ? json["Description"] : '',
    price: json["Price"] is num ? (json["Price"] as num).toDouble() : 0.0,
  ) {
    if (json["CategoryId"] is String) {
      categoryId = json["CategoryId"];
    }
    if (json["Images"] is List) {
      images = json["Images"] == null
          ? null
          : (json["Images"] as List).map((e) => Images.fromJson(e)).toList();
    }
    if (json["Reviews"] is List) {
      reviews = json["Reviews"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Name"] = name;
    data["Price"] = price;
    data["Description"] = description;
    data["CategoryId"] = categoryId;
    data["Img"] = img;
    if (images != null) {
      data["Images"] = images?.map((e) => e.toJson()).toList();
    }
    if (reviews != null) {
      data["Reviews"] = reviews;
    }
    return data;
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    if (json["Image"] is String) {
      image = json["Image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Image"] = image;
    return data;
  }
}
