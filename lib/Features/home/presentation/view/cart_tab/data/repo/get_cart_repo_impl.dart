import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/data/data_source/get_cart_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/entities/cart_entity.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/repo/get_cart_repo.dart';

class GetCartRepoImpl extends GetCartRepo{
  final GetCartRemoteDataSource getCartRemoteDataSource;

  GetCartRepoImpl({required this.getCartRemoteDataSource});
  @override
  Future<Either<Failure, CartEntity>> getCart({required String token})async{
    try {
      print('true');
      var products = await getCartRemoteDataSource.getCart();
      print('products $products');
      return right(products);
    } catch (e) {
      print('e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
}