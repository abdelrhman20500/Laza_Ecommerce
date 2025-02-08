import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../home_tab/data/models/product_model.dart';
import '../../../home_tab/domain/entities/product_entity.dart';

abstract class GetFavRemoteDataSource {
  Future<List<ProductEntity>> getWishlist();
}

class GetFavRemoteDataSourceImpl extends GetFavRemoteDataSource {
  final ApiService apiService;

  GetFavRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> getWishlist() async {
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";

    final response =
    await apiService.getFav(endpoint: "/api/WishList/GetUserWishList", token: token,);
    final List<dynamic> data = response;
    List<ProductEntity> products = data.map((item) {
      final productModel = ProductModel.fromJson(item as Map<String, dynamic>);
      return productModel as ProductEntity;
    }).toList();
    return products;
  }
}
