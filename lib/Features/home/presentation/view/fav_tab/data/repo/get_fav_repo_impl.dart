import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/data/data_source/get_fav_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/domain/repo/get_fav_repo.dart';

import '../../../home_tab/domain/entities/product_entity.dart';

class GetFavRepoImpl extends GetFavRepo {
  final GetFavRemoteDataSource getFavRemoteDataSource;

  GetFavRepoImpl({required this.getFavRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getWishlist(
      {required String token}) async {
    try {
      var products = await getFavRemoteDataSource.getWishlist();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
