import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/product_details/data/data_source/product_details_remote_data_source.dart';
import 'package:laza_e_commerce/Features/product_details/domain/repo/product_details_repo.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepoImpl({required this.productDetailsRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductDetailsRepo(
      {required String productId}) async {
    try {
      var product = await productDetailsRemoteDataSource.fetchProductDetailsById(productId: productId);
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
