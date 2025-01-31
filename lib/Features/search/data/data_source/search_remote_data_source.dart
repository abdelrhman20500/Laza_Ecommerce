import 'package:laza_e_commerce/Core/functions/api_service.dart';

import '../../../home/presentation/view/home_tab/data/models/product_model.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<ProductEntity>> searchFeaturedProduct({required String query});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductEntity>> searchFeaturedProduct({required String query})async{
    var response = await apiService.get(endpoint: "https://laza.runasp.net/api/Product/Search?SearchTerm$query");
    List<dynamic> data = response; // Extract the data
    List<ProductEntity> products = getProductsList(data);
    return products;
  }
  /// Method to convert API response to ProductEntity list
  List<ProductEntity> getProductsList(List<dynamic> data) {
    List<ProductEntity> products = [];
    for (var productMap in data) {
      products.add(ProductModel.fromJson(productMap));
    }
    return products;
  }
}