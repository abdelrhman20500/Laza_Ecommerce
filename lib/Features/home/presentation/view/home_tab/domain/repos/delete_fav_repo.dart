import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';

abstract class DeleteFavRepo{
  Future<Either<Failure, void>> deleteFav(
      {required String token,
        required String productId,
        required String name,
        required double price,
        required String image});
}