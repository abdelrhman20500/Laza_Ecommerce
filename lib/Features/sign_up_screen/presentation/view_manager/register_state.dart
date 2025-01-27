import 'package:laza_e_commerce/Features/sign_up_screen/data/model/auth_register.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthRegister authRegister;

  RegisterSuccess(this.authRegister);
}

final class RegisterFailure extends RegisterState {
  final String errMessage;
  RegisterFailure(this.errMessage);
}
