import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/review/domain/use_case/all_reviews_use_case.dart';
import 'package:laza_e_commerce/Features/review/presentation/view_manager/All_Review/all_reviews_state.dart';

class AllReviewsCubit extends Cubit<AllReviewsState> {
  final AllReviewsUseCase allReviewsUseCase;

  AllReviewsCubit(this.allReviewsUseCase) : super(AllReviewsInitial());

  Future<void> fetchAllReviews({required String productId}) async {
    emit(AllReviewsLoading());
    var result = await allReviewsUseCase.call(productId);
    result.fold(
          (failure) => emit(AllReviewsFailure(failure.errMessage)),
          (reviews) {
        if (reviews.isEmpty) {
          emit(AllReviewsEmpty());
        } else {
          emit(AllReviewsSuccess(reviews));
        }
      },
    );
  }
}
