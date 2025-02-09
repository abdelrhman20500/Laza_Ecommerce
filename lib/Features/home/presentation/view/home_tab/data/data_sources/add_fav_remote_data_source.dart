import 'package:laza_e_commerce/Core/functions/api_service.dart';

abstract class AddFavRemoteDataSource {
  Future<void> addFav({
    required String productId,
    required String name,
    required double price,
    required String image,
  });
}

class AddFavRemoteDataSourceImpl extends AddFavRemoteDataSource {
  final ApiService apiService;

  AddFavRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> addFav({
    required String productId,
    required String name,
    required double price,
    required String image,
  }) async {
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";

    try {
      await apiService.post(
        "/api/WishList/Add-WishList",
        {
          "Id": productId,
          "Name": name,
          "Price": price,
          "Img": image,
        },
        token: token,
      );
    } catch (e) {
      // print("Error adding to favorites: $e");
      throw Exception('Failed to add to favorites');
    }
  }
}