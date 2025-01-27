import 'package:laza_e_commerce/Features/verification_code/data/model/verification_code.dart';

abstract class VerificationCodeRepo{
  Future<VerificationCode> verificationCode({
    required String code,
    required String email,
});
}