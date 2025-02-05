import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/review/domain/use_case/all_reviews_use_case.dart';
import 'package:laza_e_commerce/Features/review/presentation/view_manager/All_Review/all_reviews_state.dart';

class AllReviewsCubit extends Cubit<AllReviewsState>{
  AllReviewsCubit(this.allReviewsUseCase) :super(AllReviewsInitial());
  final AllReviewsUseCase allReviewsUseCase;
  Future<void> fetchAllReviews({required String productId}) async {
    emit(AllReviewsLoading());
    var result = await allReviewsUseCase.call(productId);
    result.fold((failure) {
      emit(AllReviewsFailure(failure.errMessage));
    }, (reviews) {
      emit(AllReviewsSuccess(reviews));
    });
  }
}