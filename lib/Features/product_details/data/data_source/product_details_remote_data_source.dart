import 'package:laza_e_commerce/Core/functions/api_service.dart';
import '../../../home/presentation/view/home_tab/data/models/product_model.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductEntity> fetchProductDetailsById({required String productId});
}

class ProductDetailsRemoteDataSourceImpl extends ProductDetailsRemoteDataSource {
  final ApiService apiService;

  ProductDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProductEntity> fetchProductDetailsById({required String productId}) async {
    var response = await apiService.getDetails(endpoint: "/api/Product/GetProductBy/$productId");
    print(response);
    // Convert response to ProductEntity
    return ProductModel.fromJson(response);
  }

  // Method to convert API response to ProductEntity list (if needed elsewhere)
  List<ProductEntity> getProductsList(List<dynamic> data) {
    List<ProductEntity> products = [];
    for (var productMap in data) {
      products.add(ProductModel.fromJson(productMap));
    }
    return products;
  }
}
