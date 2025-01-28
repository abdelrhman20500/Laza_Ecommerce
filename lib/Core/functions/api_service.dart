import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://laza.runasp.net";

  ApiService(this.dio);

  Future<Response> post(String endPoint, Map<String, dynamic> data,{String? token}) async {
    var response = await dio.post(endPoint,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }


  Future<List<dynamic>> get({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint");
    return response.data;
  }
}