import 'package:laza_e_commerce/Features/forget_password/data/model/reset_password.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPassword resetPassword;

  ResetPasswordSuccess(this.resetPassword);
}

class ResetPasswordFailure extends ResetPasswordState {
  final String errMessage;
  ResetPasswordFailure(this.errMessage);
}
