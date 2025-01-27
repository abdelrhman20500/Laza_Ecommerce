import 'package:laza_e_commerce/Features/forget_password/data/model/reset_password.dart';

abstract class ResetPasswordRepo {
  Future<ResetPassword> resetPassword({
    required String email,
  });
}
