import 'package:dartz/dartz.dart';
import '../../../../Core/utils/failure.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductCategoryByIdRepo{
  Future<Either<Failure, List<ProductEntity>>> getProductDetailsRepo({required String token ,required String productId});
}