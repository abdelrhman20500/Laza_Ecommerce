import 'package:dartz/dartz.dart';
import '../../../../../../../Core/utils/failure.dart';
import '../../../home_tab/domain/entities/product_entity.dart';

abstract class GetFavRepo{
  Future<Either<Failure, List<ProductEntity>>> getFavorites(
      {required String token});
}