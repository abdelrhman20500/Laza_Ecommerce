
class ProductDetailsModel {
  String? id;
  String? name;
  double? price;
  String? description;
  String? categoryId;
  String? img;
  List<Images>? images;
  List<Reviews>? reviews;

  ProductDetailsModel({this.id, this.name, this.price, this.description, this.categoryId, this.img, this.images, this.reviews});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
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
      reviews = json["Reviews"] == null ? null : (json["Reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
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
      data["Reviews"] = reviews?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? username;
  String? feedback;
  double? rating;

  Reviews({this.username, this.feedback, this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    if(json["Username"] is String) {
      username = json["Username"];
    }
    if(json["Feedback"] is String) {
      feedback = json["Feedback"];
    }
    if(json["Rating"] is num) {
      rating = (json["Rating"] as num).toDouble();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Username"] = username;
    data["Feedback"] = feedback;
    data["Rating"] = rating;
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