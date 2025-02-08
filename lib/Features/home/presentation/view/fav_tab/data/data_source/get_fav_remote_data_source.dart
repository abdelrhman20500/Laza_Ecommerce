import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import '../../../home_tab/data/models/product_model.dart';
import '../../../home_tab/domain/entities/product_entity.dart';

abstract class GetFavRemoteDataSource {
  Future<List<ProductEntity>> getFavorites();
}

class GetFavRemoteDataSourceImpl extends GetFavRemoteDataSource{
  final ApiService apiService;

  GetFavRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ProductEntity>> getFavorites()async{
   var favorites=  await apiService.get(endpoint: "/api/WishList/GetUserWishList",
   token: SharedPref.getToken());
   final List<dynamic> data = favorites.data;
   List<ProductEntity> fav = data.map((item) {
     final productModel = ProductModel.fromJson(item as Map<String, dynamic>);
     return productModel as ProductEntity;
   }).toList();
   return fav;
  }
}