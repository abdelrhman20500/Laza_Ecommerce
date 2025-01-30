import '../../../../Core/functions/api_service.dart';
import '../../../home/presentation/view/home_tab/data/models/product_model.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductByCategoryIdRemoteDataSource {
  Future<List<ProductEntity>> fetchProductCategoryById({required String categoryId});
}

class ProductByCategoryIdRemoteDataSourceImpl extends ProductByCategoryIdRemoteDataSource{
  final ApiService apiService;

  ProductByCategoryIdRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> fetchProductCategoryById({required String categoryId})async {
    var response = await apiService.get(endpoint: "/api/Product/GetProductsByCategoryId?categoryId$categoryId");
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