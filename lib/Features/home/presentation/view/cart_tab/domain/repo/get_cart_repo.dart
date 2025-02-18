import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';
import '../entities/cart_entity.dart';


abstract class GetCartRepo {
  Future<Either<Failure, CartEntity>> getCart({required String token,});
}
