import 'package:hive/hive.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/constant.dart';

abstract class ProductLocalDataSource{
  List<ProductEntity> fetchFeaturedProduct();
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource{
  @override
  List<ProductEntity> fetchFeaturedProduct() {
    var box = Hive.box<ProductEntity>(kFeaturedBox);
    return box.values.toList();
  }
}