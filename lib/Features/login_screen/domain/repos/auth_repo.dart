import 'package:laza_e_commerce/Features/login_screen/data/models/auth_login.dart';

abstract class AuthRepo {
  Future<AuthLogin> userLogin(
      {required String email,
      required String password,
      required bool remember});
}
