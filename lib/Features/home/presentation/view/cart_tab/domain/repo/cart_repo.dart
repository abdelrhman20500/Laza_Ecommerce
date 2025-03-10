import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';
import '../entities/cart_entity.dart';


abstract class CartRepo {
  Future<Either<Failure, void>> addCart(
      {required String token, required String productId});
}
