import 'package:dartz/dartz.dart';
import '../../../../Core/utils/failure.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductDetailsRepo{
  Future<Either<Failure, ProductEntity>> getProductDetailsRepo({required String productId});
}