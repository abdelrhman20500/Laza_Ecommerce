import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/new_password/domain/use_case/update_password_use_case.dart';
import 'package:laza_e_commerce/Features/new_password/presentation/view_manager/up_date_password_state.dart';


class UpDatePasswordCubit extends Cubit<UpDatePasswordState> {
  final UpdatePasswordUseCase updatePasswordUseCase;

  UpDatePasswordCubit(this.updatePasswordUseCase) : super(UpDatePasswordInitial());

  Future<void> update(String email, String newPassword, String confirmPassword) async {
    emit(UpDatePasswordLoading());
    try {
      final result = await updatePasswordUseCase.call(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      emit(UpDatePasswordSuccess(result));
    } catch (e) {
      emit(UpDatePasswordFailure(e.toString()));
    }
  }
}