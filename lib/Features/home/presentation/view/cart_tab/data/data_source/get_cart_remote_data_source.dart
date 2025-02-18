import '../../../../../../../Core/functions/api_service.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../model/cart_item_model.dart';

abstract class GetCartRemoteDataSource {
  Future<CartEntity> getCart();
}

class GetCartRemoteDataSourceImplement extends GetCartRemoteDataSource {
  final ApiService apiService;

  GetCartRemoteDataSourceImplement(this.apiService);



  @override
  Future<CartEntity> getCart() async {
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";

    final response = await apiService.getCart(
      endpoint: "/api/Cart/GetCart", token: token,);
    final Map<String, dynamic> data = response;
    print('data $data');
    final String? id = data['Id'] as String?;
    final String? userId = data['UserId'] as String?;
    final double totalPrice = (data['TotalPrice'] as num?)?.toDouble() ?? 0.0;

    final List<dynamic> items = data['Items'] ?? [];
    List<CartItemEntity> products = items.map((item) {
      return CartItemModel.fromJson(item as Map<String, dynamic>);
    }).toList();
    print('products $products');
    final CartEntity cart = CartEntity(
      id: id ?? '',
      userId: userId ?? '',
      totalPrice: totalPrice,
      items: products,
    );
    return cart;
    }
}
