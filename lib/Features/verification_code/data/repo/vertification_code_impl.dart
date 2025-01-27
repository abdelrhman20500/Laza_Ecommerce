import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/verification_code/data/model/verification_code.dart';
import 'package:laza_e_commerce/Features/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeImpl implements VerificationCodeRepo{
  final ApiService apiService;

  VerificationCodeImpl(this.apiService);
  @override
  Future<VerificationCode> verificationCode({required String code, required String email}) async{
    var response = await apiService.post("https://laza.runasp.net/api/Auth/verify-code", {
      "code": code,
      "email":email,
    });
    if (response.statusCode == 200) {
      // Assuming response.data is a Map<String, dynamic>
      return VerificationCode.fromJson(response.data); // Convert the Map to AuthLogin object
    } else {
      throw Exception('Failed to verify code'); // Handle error appropriately
    }
  }
}