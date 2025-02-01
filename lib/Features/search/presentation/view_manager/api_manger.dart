import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Features/search/data/model/search_model.dart';

class ApiManger {
  static Future<List<SearchModel>> searchProduct(String query) async {
    final dio = Dio();
    final String url = "https://laza.runasp.net/api/Product/Search?SearchTerm=$query";

    try {
      Response response = await dio.get(url);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null && response.data.isNotEmpty) {
          List<dynamic> jsonData = response.data;
          print("WWWWWWW");
          print(jsonData);
          List<SearchModel> searchModel = jsonData.map((item) => SearchModel.fromJson(item)).toList();
          return searchModel;
        } else {
          // Handle case where response body is empty
          throw Exception("Empty response body");
        }
      } else {
        // Handle non-successful response status code
        throw Exception("Something went wrong: ${response.statusCode}");
      }
    } catch (e) {
      // Handle errors during the request
      throw Exception("Failed to load search results: $e");
    }
  }
}
