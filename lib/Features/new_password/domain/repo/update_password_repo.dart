import 'package:laza_e_commerce/Features/new_password/data/model/update_password.dart';

abstract class UpdatePasswordRepo {
  Future<UpdatePassword> update({
    required String email,
    required String newPassword,
    required String confirmPassword
});
}