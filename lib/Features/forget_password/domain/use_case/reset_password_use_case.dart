import 'package:laza_e_commerce/Features/forget_password/data/model/reset_password.dart';
import 'package:laza_e_commerce/Features/forget_password/domain/repo/reset_password_repo.dart';

class ResetPasswordUseCase{
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase(this.resetPasswordRepo);
  Future<ResetPassword> call({required String email})async{
    return await resetPasswordRepo.resetPassword(email: email);
  }
}