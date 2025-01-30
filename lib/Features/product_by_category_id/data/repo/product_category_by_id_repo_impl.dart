import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/data/data_source/product_by_category_id_remote_data_source.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/domain/repo/product_category_by_id_repo.dart';

class ProductCategoryByIdRepoImpl extends ProductCategoryByIdRepo{
  final ProductByCategoryIdRemoteDataSource productByCategoryIdRemoteDataSource;

  ProductCategoryByIdRepoImpl(this.productByCategoryIdRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductByCategoryId({required String categoryId})async{
    try {
      var product = await productByCategoryIdRemoteDataSource.fetchProductCategoryById(categoryId: categoryId);
      return right(product);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}