import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/delete_fav_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/repos/delete_fav_repo.dart';

class DeleteFavRepoImpl extends DeleteFavRepo{
  final DeleteFavRemoteDataSource deleteFavRemoteDataSource;

  DeleteFavRepoImpl({required this.deleteFavRemoteDataSource});
  @override
  Future<Either<Failure, void>> deleteFav({required String token, required String productId,
    required String name, required double price, required String image})async{
    try {
      var response = await deleteFavRemoteDataSource.deleteFav(productId: productId, name: name, price: price, image: image);
          return right(response);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}