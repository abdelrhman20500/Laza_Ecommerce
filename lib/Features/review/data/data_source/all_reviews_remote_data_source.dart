import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/review/data/model/review_model.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';

abstract class AllREviewsRemoteDataSource{
  Future<List<ReviewEntity>> fetchAllReviews({required String productId});
}

class AllReviewsRemoteDataSourceImpl extends AllREviewsRemoteDataSource{
  final ApiService apiService;

  AllReviewsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ReviewEntity>> fetchAllReviews({required String productId}) async{
   var response =  await apiService.get(endpoint: "/api/Review/All-reviews/$productId",
       token: SharedPref.getToken().toString());
   List<dynamic> data = response;
   List<ReviewEntity> reviews = getAllReviews(data);
   return reviews;
  }

  // Method to convert API response to ProductEntity list (if needed elsewhere)
  List<ReviewEntity> getAllReviews(List<dynamic> data) {
    List<ReviewEntity> reviews = [];
    for (var reviewMap in data) {
      reviews.add(ReviewModel.fromJson(reviewMap));
    }
    return reviews;
  }
}