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
    var response = await apiService.getProductDetails(endpoint: "/api/Product/GetProductBy/$productId");
    return ProductModel.fromJson(response);
  }
}
