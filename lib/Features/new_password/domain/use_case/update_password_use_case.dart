import 'package:laza_e_commerce/Features/new_password/data/model/update_password.dart';
import 'package:laza_e_commerce/Features/new_password/domain/repo/update_password_repo.dart';

class UpdatePasswordUseCase{
  final UpdatePasswordRepo updatePasswordRepo;
  UpdatePasswordUseCase(this.updatePasswordRepo);

  Future<UpdatePassword> call({required String email, required String newPassword, required String confirmPassword})async{
    return await updatePasswordRepo.update(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword
    );
  }

}