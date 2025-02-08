class AddReviewModel {
  String? id;
  String? userId;
  String? userName;
  String? feedback;
  int? rating;
  String? productId;
  dynamic product;

  AddReviewModel({this.id, this.userId, this.userName, this.feedback, this.rating, this.productId, this.product});

  AddReviewModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is String) {
      id = json["Id"];
    }
    if(json["UserId"] is String) {
      userId = json["UserId"];
    }
    if(json["UserName"] is String) {
      userName = json["UserName"];
    }
    if(json["Feedback"] is String) {
      feedback = json["Feedback"];
    }
    if(json["Rating"] is num) {
      rating = (json["Rating"] as num).toInt();
    }
    if(json["productId"] is String) {
      productId = json["productId"];
    }
    product = json["Product"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["UserId"] = userId;
    data["UserName"] = userName;
    data["Feedback"] = feedback;
    data["Rating"] = rating;
    data["productId"] = productId;
    data["Product"] = product;
    return data;
  }
}