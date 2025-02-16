import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/data/data_source/cart_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/repo/cart_repo.dart';

class CartImpl extends CartRepo{
  final CartRemoteDataSource cartRemoteDataSource;

  CartImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, void>> addCart({required String token, required String productId})async{
    try {
      var product = await cartRemoteDataSource.addCart(productId: productId);
      print('Add to cart successful');
      return right(product);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
}