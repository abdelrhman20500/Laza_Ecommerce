import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';

abstract class AddFavRepo{
  Future<Either<Failure, void>> addFav(
      {required String token,
        required String productId,
        required String name,
        required double price,
        required String image});
}