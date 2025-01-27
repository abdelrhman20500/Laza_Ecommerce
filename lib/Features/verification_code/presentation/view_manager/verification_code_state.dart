import 'package:laza_e_commerce/Features/verification_code/data/model/verification_code.dart';

abstract class VerificationCodeState {}

final class VerificationCodeInitial extends VerificationCodeState {}

final class VerificationCodeLoading extends VerificationCodeState {}

final class VerificationCodeSuccess extends VerificationCodeState {
  final VerificationCode verificationCode;

  VerificationCodeSuccess(this.verificationCode);
}

final class VerificationCodeFailure extends VerificationCodeState {
  final String errMessage;
  VerificationCodeFailure(this.errMessage);
}
