import 'package:laza_e_commerce/Features/login_screen/data/models/auth_login.dart';
import 'package:laza_e_commerce/Features/login_screen/domain/repos/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<AuthLogin> call(
      {required String email,
      required String password,
      required bool remember}) async {
    return await authRepo.userLogin(
        email: email, password: password, remember: remember);
  }
}
