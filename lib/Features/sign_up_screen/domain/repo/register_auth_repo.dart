import '../../data/model/auth_register.dart';

abstract class RegisterAuthRepo {
  Future<AuthRegister> userRegister(
      {required String name,
        required String email,
        required String password,
        required bool remember});
}
