
class ProductModel {
  String? id;
  String? name;
  double? price;
  String? description;
  String? categoryId;
  String? img;
  List<Images>? images;
  List<dynamic>? reviews;

  ProductModel({this.id, this.name, this.price, this.description, this.categoryId, this.img, this.images, this.reviews});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is String) {
      id = json["Id"];
    }
    if(json["Name"] is String) {
      name = json["Name"];
    }
    if(json["Price"] is num) {
      price = (json["Price"] as num).toDouble();
    }
    if(json["Description"] is String) {
      description = json["Description"];
    }
    if(json["CategoryId"] is String) {
      categoryId = json["CategoryId"];
    }
    if(json["Img"] is String) {
      img = json["Img"];
    }
    if(json["Images"] is List) {
      images = json["Images"] == null ? null : (json["Images"] as List).map((e) => Images.fromJson(e)).toList();
    }
    if(json["Reviews"] is List) {
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
    if(images != null) {
      data["Images"] = images?.map((e) => e.toJson()).toList();
    }
    if(reviews != null) {
      data["Reviews"] = reviews;
    }
    return data;
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    if(json["Image"] is String) {
      image = json["Image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Image"] = image;
    return data;
  }
}