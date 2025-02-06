import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/review/domain/use_case/add_review_use_case.dart';
import 'package:laza_e_commerce/Features/review/presentation/view_manager/Add_review/add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final AddReviewUseCase addReviewUseCase;

  AddReviewCubit(this.addReviewUseCase) : super(AddReviewInitial());

  Future<void> addReview(
      {required String productId,
        required String name,
        required String feedback,
        required double rate}) async {
    print('add review cubit');
    var result = await addReviewUseCase.call(
      AddReviewParams(
          productId: productId, name: name, feedback: feedback, rate: rate),
    );
    print('result $result');
    result.fold((failure) {
      print('failure state ${failure.errMessage}');
      emit(AddReviewFailure(failure.errMessage));
    }, (_) {
      emit(AddReviewSuccess());
      print('success state');
    });
  }
}
