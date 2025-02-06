import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/review/data/model/review_model.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';

abstract class AllReviewsRemoteDataSource {
  Future<List<ReviewEntity>> getReviews({required String productId});

}

class AllReviewsRemoteDataSourceImpl extends AllReviewsRemoteDataSource {
  final ApiService apiService;

  AllReviewsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ReviewEntity>> getReviews({required String productId}) async{
    try {
      final response = await apiService.get(endpoint: "/Review/All-reviews/:$productId",
          token: SharedPref.getToken());
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<ReviewEntity> reviews = data.map((item) {
          final reviewModel =
          ReviewModel.fromJson(item as Map<String, dynamic>);
          return reviewModel as ReviewEntity;
        }).toList();

        return reviews;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

}
