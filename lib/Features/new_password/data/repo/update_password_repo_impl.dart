import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/new_password/data/model/update_password.dart';
import 'package:laza_e_commerce/Features/new_password/domain/repo/update_password_repo.dart';

class UpdatePasswordRepoImpl implements UpdatePasswordRepo{
  final ApiService apiService;

  UpdatePasswordRepoImpl(this.apiService);
  @override
  Future<UpdatePassword> update({required String email, required String newPassword, required String confirmPassword})async{
    var response = await apiService.post("https://laza.runasp.net/api/Auth/update-password", {
      "Email": email,
      "NewPassword": newPassword,
      "ConfirmPassword": confirmPassword
    });
    if (response.statusCode == 200) {
      // Assuming response.data is a Map<String, dynamic>
      return UpdatePassword.fromJson(response.data); // Convert the Map to AuthLogin object
    } else {
      throw Exception('Failed to update'); // Handle error appropriately
    }
  }
}