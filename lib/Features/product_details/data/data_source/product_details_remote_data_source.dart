import 'package:laza_e_commerce/Core/functions/api_service.dart';
import '../../../home/presentation/view/home_tab/data/models/product_model.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<List<ProductEntity>> fetchProductDetailsById({required String productId});
}

class ProductDetailsRemoteDataSourceImpl extends ProductDetailsRemoteDataSource{

  final ApiService apiService;

  ProductDetailsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductEntity>> fetchProductDetailsById({required String productId})async {
   var response = await apiService.get(endpoint: "https://laza.runasp.net/api/Product/GetProductBy/$productId");
   List<dynamic> data = response;
   List<ProductEntity> products = getCategoryIDProductsList(data);
   return products;
  }

  /// Method to convert API response to ProductEntity list
  List<ProductEntity> getCategoryIDProductsList(List<dynamic> data) {
    List<ProductEntity> products = [];
    for (var productMap in data) {
      products.add(ProductModel.fromJson(productMap));
    }
    return products;
  }
}