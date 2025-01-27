class AuthRegister {
  String? message;

  AuthRegister({this.message});

  AuthRegister.fromJson(Map<String, dynamic> json) {
    if (json["Message"] is String) {
      message = json["Message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Message"] = message;
    return data;
  }
}
