import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/login_screen/data/models/auth_login.dart';
import 'package:laza_e_commerce/Features/login_screen/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<AuthLogin> userLogin({required String email, required String password, required bool remember})async {
    final response = await apiService.post("https://laza.runasp.net/api/Auth/Login",{
      "Email" : email,
      "Password" : password,
      "RememberMe" :remember,
    });

    if (response.statusCode == 200) {
      // Assuming response.data is a Map<String, dynamic>
      return AuthLogin.fromJson(response.data); // Convert the Map to AuthLogin object
    } else {
      throw Exception('Failed to login'); // Handle error appropriately
    }
  }

}