import '../../../data/model/add_review_model.dart';

abstract class AddReviewState {}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {
  final AddReviewModel review;

  AddReviewSuccess(this.review);
}

class AddReviewFailure extends AddReviewState {
  final String errMessage;

  AddReviewFailure({required this.errMessage});
}