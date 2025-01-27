
class VerificationCode {
  String? message;

  VerificationCode({this.message});

  VerificationCode.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    return data;
  }
}