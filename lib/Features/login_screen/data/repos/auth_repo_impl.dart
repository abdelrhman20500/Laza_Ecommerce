import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/login_screen/data/models/auth_login.dart';
import 'package:laza_e_commerce/Features/login_screen/data/models/auth_register.dart';
import 'package:laza_e_commerce/Features/login_screen/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<AuthLogin> userLogin({required String email, required String password, required bool remember})async {
    final response = await apiService.post("/Auth/Login", {
      "Email" : email,
      "Password" : password,
      "RememberMe" :remember,
    });
    return response.data;
  }

  @override
  Future<AuthRegister> userRegister({required String name, required String email, required String password, 
    required bool remember}) async{
   final response= await apiService.post("/Auth/Register", {
     'Name': name,
     'Email': email,
     'Password': password,
     "RememberMe": remember
   });
   return response.data;
  }
}