import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://laza.runasp.net/api";
  ApiService(this.dio);

  Future<Response> post(String endPoint, Map<String, dynamic> data,{String? token}) async {
    var response = await dio.post("$baseUrl$endPoint",
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }
}