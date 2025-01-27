
class UpdatePassword {
  String? message;

  UpdatePassword({this.message});

  UpdatePassword.fromJson(Map<String, dynamic> json) {
    if(json["Message"] is String) {
      message = json["Message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Message"] = message;
    return data;
  }
}