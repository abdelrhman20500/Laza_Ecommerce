import 'package:dartz/dartz.dart';
import '../../../../Core/utils/failure.dart';
import '../entities/review_entity.dart';

abstract class AddReviewRepo{
  Future<Either<Failure, ReviewEntity>> addReview(
      {required String token,
        required String productId,
        required String name,
        required String feedback,
        required double rate});
}