import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:laza_e_commerce/Features/search/domain/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProduct({required String query})async{
    try {
      var searchProduct = await searchRemoteDataSource.searchFeaturedProduct(query: query);
      return right(searchProduct);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}