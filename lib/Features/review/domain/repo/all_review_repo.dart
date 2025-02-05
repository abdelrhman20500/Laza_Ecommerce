import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';

abstract class AllReviewsRepo{
  Future<Either<Failure, List<ReviewEntity>>> getAllReviews({required String token, required String productId});
}