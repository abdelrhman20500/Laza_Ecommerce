import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';


abstract class CartRepo {
  Future<Either<Failure, void>> addCart(
      {required String token, required String productId});
}
