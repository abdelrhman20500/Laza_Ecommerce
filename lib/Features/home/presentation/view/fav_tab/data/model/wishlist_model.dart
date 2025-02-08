
class WishListModel {
  String? id;
  String? name;
  double? price;
  String? img;

  WishListModel({this.id, this.name, this.price, this.img});

  WishListModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is String) {
      id = json["Id"];
    }
    if(json["Name"] is String) {
      name = json["Name"];
    }
    if(json["Price"] is num) {
      price = (json["Price"] as num).toDouble();
    }
    if(json["Img"] is String) {
      img = json["Img"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["Name"] = name;
    data["Price"] = price;
    data["Img"] = img;
    return data;
  }
}