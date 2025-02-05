
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';

abstract class AllReviewsState{}
class AllReviewsInitial extends AllReviewsState{}
class AllReviewsLoading extends AllReviewsState{}

class AllReviewsSuccess extends AllReviewsState{
  final List<ReviewEntity> reviews;

  AllReviewsSuccess(this.reviews);
}
class AllReviewsFailure extends AllReviewsState{
  final String errMessage;

  AllReviewsFailure(this.errMessage);
}
