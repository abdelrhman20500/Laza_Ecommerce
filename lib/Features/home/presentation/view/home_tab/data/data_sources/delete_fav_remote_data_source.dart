import 'package:laza_e_commerce/Core/functions/api_service.dart';

abstract class DeleteFavRemoteDataSource {
  Future<void> deleteFav(
      {required String productId,
      required String name,
      required double price,
      required String image});
}

class DeleteFavRemoteDataSourceImpl extends DeleteFavRemoteDataSource {
  final ApiService apiService;

  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";

  DeleteFavRemoteDataSourceImpl(this.apiService);
  @override
  Future<void> deleteFav(
      {required String productId,
      required String name,
      required double price,
      required String image}) async {
    var response = await apiService.delete(
      "/api/WishList/RemoveFromWishList",
      {
        "Id": productId,
        "Name": name,
        "Price": price,
        "Img": image,
      },
      token: token,
    );
    return response.data;
  }
}
