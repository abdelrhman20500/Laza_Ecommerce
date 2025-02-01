import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/search/data/model/search_model.dart';
import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';


abstract class SearchRemoteDataSource{
  Future<List<SearchEntity>> searchFeaturedProduct({required String query});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<SearchEntity>> searchFeaturedProduct({required String query})async{
    var response = await apiService.get(endpoint:
    "https://laza.runasp.net/api/Product/Search?SearchTerm=$query");
    List<dynamic> data = response; // Extract the data
    List<SearchEntity> products = getProductsList(data);
    print("#############################");
    print(products);
    return products;
  }
  /// Method to convert API response to ProductEntity list
  List<SearchEntity> getProductsList(List<dynamic> data) {
    List<SearchEntity> products = [];
    for (var productMap in data) {
      products.add(SearchModel.fromJson(productMap));
    }
    return products;
  }
}

