import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/review/data/data_source/add_review_remote_data_source.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';
import 'package:laza_e_commerce/Features/review/domain/repo/add_review_repo.dart';

class AddReviewRepoImpl extends AddReviewRepo{
  final AddReviewRemoteDateSource addReviewRemoteDateSource;

  AddReviewRepoImpl({required this.addReviewRemoteDateSource});
  @override
  Future<Either<Failure, ReviewEntity>> addReview({required String token, required String productId,
    required String name, required String feedback, required double rate}) async{
    try {
      var reviews = await addReviewRemoteDateSource.addReview(
          productId: productId, name: name, feedback: feedback, rate: rate);
      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}