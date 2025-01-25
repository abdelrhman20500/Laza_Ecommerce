import 'package:laza_e_commerce/Features/login_screen/data/models/auth_register.dart';
import 'package:laza_e_commerce/Features/login_screen/domain/repos/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<AuthRegister> call(
      {required String name,
      required String email,
      required String password,
      required bool remember}) async {
    return await authRepo.userRegister(
        name: name, email: email, password: password, remember: remember);
  }
}
