import 'package:laza_e_commerce/Features/verification_code/data/model/verification_code.dart';
import 'package:laza_e_commerce/Features/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeUseCase{
  final VerificationCodeRepo verificationCodeRepo;

  VerificationCodeUseCase(this.verificationCodeRepo);
  Future<VerificationCode> call({required String code , required String email})async{
    return await verificationCodeRepo.verificationCode(code: code, email: email);
  }
}