import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  final baseUrl = "https://laza.runasp.net";

  ApiService(this.dio);
  /// post method...
  Future<Response> post(String endPoint, Map<String, dynamic> data, {String? token}) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      data: data,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );

    return response;
  }
 ///  https://laza.runasp.net/api/Cart/AddToCart
  /// delete method
  Future<Response> delete(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    var response = await dio.delete(endPoint,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }

 /// get method..
  Future<Response> get({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
        options:Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    // print("Response Status: ${response.statusCode}");
    // print("Response Data: ${response.data}");
    return response.data;
  }

  Future<List<dynamic>> getFav({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
        options:Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    // print("Response Status: ${response.statusCode}");
    // print("Response Data: ${response.data}");
    return response.data;
  }

/// getCart
  Future<Map<String, dynamic>> getCart({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint",
        options:Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    // print("Response Status: ${response.statusCode}");
    // print("Response Data: ${response.data}");
    return response.data;
  }

  /// get product details...
  Future<Map<String, dynamic>> getProductDetails({required String endpoint ,String? token}) async {
    var response = await dio.get("$baseUrl$endpoint");
    return response.data;
  }
}

