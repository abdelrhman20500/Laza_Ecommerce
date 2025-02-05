import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required String name,
    required String feedback,
    required double rating,
  }) : super(name: name, feedback: feedback, rating: rating);

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["Username"] is String ? json["Username"] : '',
      feedback: json["Feedback"] is String ? json["Feedback"] : '',
      rating: json["Rating"] is num ? (json["Rating"] as num).toDouble() : 0.0,
    );
  }

  // تحويل ReviewModel إلى JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Username"] = name;
    data["Feedback"] = feedback;
    data["Rating"] = rating;
    return data;
  }
}

