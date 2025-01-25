class AuthLogin {
  String? token;
  String? expire;

  AuthLogin({this.token, this.expire});

  AuthLogin.fromJson(Map<String, dynamic> json) {
    if (json["Token"] is String) {
      token = json["Token"];
    }
    if (json["Expire"] is String) {
      expire = json["Expire"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Token"] = token;
    data["Expire"] = expire;
    return data;
  }
}
