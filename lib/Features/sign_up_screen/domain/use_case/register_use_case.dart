import 'package:laza_e_commerce/Features/sign_up_screen/data/model/auth_register.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/domain/repo/register_auth_repo.dart';

class RegisterUseCase {
  final RegisterAuthRepo registerAuthRepo;

  RegisterUseCase(this.registerAuthRepo);

  Future<AuthRegister> call(
      {required String name,
      required String email,
      required String password,
      required bool remember}) async {
    return await registerAuthRepo.userRegister(
        name: name, email: email, password: password, remember: remember);
  }
}
