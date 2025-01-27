import 'package:laza_e_commerce/Features/login_screen/data/models/auth_login.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthLogin authLogin;

  LoginSuccess(this.authLogin);
}

final class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}
