import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import '../../domain/entities/review_entity.dart';
import '../model/review_model.dart';

abstract class AddReviewRemoteDataSource {
  Future<ReviewEntity> addReview(
      {required String productId,
        required String name,
        required String feedback,
        required double rate});
}

class AddReviewRemoteDataSourceImpl extends AddReviewRemoteDataSource {
  final ApiService apiService;

  AddReviewRemoteDataSourceImpl(this.apiService);

  @override
  Future<ReviewEntity> addReview({required String productId, required String name,
    required String feedback, required double rate}) async {
    final response = await apiService.post(
      '/Review/AddReview/$productId',
      {
        "Username": name,
        "Feedback": feedback,
        "Rating": rate,
      },
      token: SharedPref.getToken(),
    );

    print("API POST Response Status: ${response.statusCode}");
    print("API POST Response Data: ${response.data}");

    if (response.statusCode == 200) {
      return ReviewModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception("Failed to add review: ${response.data['message']}");
    }
  }
}
