import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/data/model/auth_register.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/domain/repo/register_auth_repo.dart';

class RegisterAuthRepoImpl implements RegisterAuthRepo{
  final ApiService apiService;

  RegisterAuthRepoImpl(this.apiService);
  @override
  Future<AuthRegister> userRegister({required String name, required String email, required String password,
    required bool remember}) async{
    final response= await apiService.post("https://laza.runasp.net/api/Auth/Register", {
      'Name': name,
      'Email': email,
      'Password': password,
      "RememberMe": remember
    });
    if (response.statusCode == 200) {
      // Assuming response.data is a Map<String, dynamic>
      return AuthRegister.fromJson(response.data); // Convert the Map to AuthLogin object
    } else {
      throw Exception('Failed to register'); // Handle error appropriately
    }
  }
}