import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/forget_password/domain/use_case/reset_password_use_case.dart';
import 'package:laza_e_commerce/Features/forget_password/presentation/view-manager/reset_password_state.dart';


class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      final result = await resetPasswordUseCase.call(
        email: email,
      );
      emit(ResetPasswordSuccess(result));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}