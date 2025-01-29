import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_local_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDateSource productRemoteDateSource;
  final ProductLocalDataSource productLocalDataSource;

  ProductRepoImpl({required this.productRemoteDateSource, required this.productLocalDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProduct() async {
    try {
      var productList = productLocalDataSource.fetchFeaturedProduct();
      if (productList.isNotEmpty) {
        return right(productList);
      }
      var products = await productRemoteDateSource.fetchFeaturedProduct();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
