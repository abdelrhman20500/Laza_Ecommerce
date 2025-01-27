import 'package:laza_e_commerce/Features/new_password/data/model/update_password.dart';

abstract class UpDatePasswordState {}

class UpDatePasswordInitial extends UpDatePasswordState {}

class UpDatePasswordLoading extends UpDatePasswordState {}

class UpDatePasswordSuccess extends UpDatePasswordState {
  final UpdatePassword updatePassword;

  UpDatePasswordSuccess(this.updatePassword);
}

class UpDatePasswordFailure extends UpDatePasswordState {
  final String errMessage;
  UpDatePasswordFailure(this.errMessage);
}
