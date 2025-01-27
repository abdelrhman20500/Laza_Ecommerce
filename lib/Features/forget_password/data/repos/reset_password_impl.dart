import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/forget_password/data/model/reset_password.dart';
import 'package:laza_e_commerce/Features/forget_password/domain/repo/reset_password_repo.dart';

class ResetPasswordImpl implements ResetPasswordRepo{
  final ApiService apiService;

  ResetPasswordImpl(this.apiService);
  @override
  Future<ResetPassword> resetPassword({required String email}) async{
   var response = await apiService.post("https://laza.runasp.net/api/Auth/reset-password",
       {
         "Email" : email,
       });

   if (response.statusCode == 200) {
     // Assuming response.data is a Map<String, dynamic>
     return ResetPassword.fromJson(response.data); // Convert the Map to AuthLogin object
   } else {
     throw Exception('Failed to reset'); // Handle error appropriately
   }
  }
}