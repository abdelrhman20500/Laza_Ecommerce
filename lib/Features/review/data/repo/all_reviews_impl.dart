import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/review/data/data_source/all_reviews_remote_data_source.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';
import 'package:laza_e_commerce/Features/review/domain/repo/all_review_repo.dart';

class AllReviewsImpl extends AllReviewsRepo{
  final AllReviewsRemoteDataSource allReviewsRemoteDataSource;

  AllReviewsImpl({required this.allReviewsRemoteDataSource});

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      {required String token, required String productId}) async {
    try {
      var reviews =  await allReviewsRemoteDataSource.getReviews(productId: productId);
      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
