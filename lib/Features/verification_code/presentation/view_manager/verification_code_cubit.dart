import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/verification_code/domain/use_case/verification_code_use_case.dart';
import 'package:laza_e_commerce/Features/verification_code/presentation/view_manager/verification_code_state.dart';


class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  final VerificationCodeUseCase verificationCodeUseCase;

  VerificationCodeCubit(this.verificationCodeUseCase) : super(VerificationCodeInitial());

  Future<void> verifyCode(String code, String email) async {
    emit(VerificationCodeLoading());
    try {
      final result = await verificationCodeUseCase.call(
        code: code,
        email: email,
      );
      emit(VerificationCodeSuccess(result));
    } catch (e) {
      emit(VerificationCodeFailure(e.toString()));
    }
  }
}