import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/models/product_model.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/constant.dart';

abstract class ProductRemoteDateSource{
  Future<List<ProductEntity>> fetchFeaturedProduct();
}

class ProductRemoteDateSourceImpl extends ProductRemoteDateSource{
  final ApiService apiService;

  ProductRemoteDateSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> fetchFeaturedProduct() async {
    var box = Hive.box<ProductEntity>(kFeaturedBox);

    // Check if there are cached products
    if (box.isNotEmpty) {
      return box.values.toList();
    }
    Response<dynamic> response = await apiService.get(endpoint: "/api/Product/GetAllProducts");
    List<dynamic> data = response.data;
    List<ProductEntity> products = getProductsList(data);
    // Cache Featured Product
    await box.putAll({ for (var v in products) v.id : v });
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
