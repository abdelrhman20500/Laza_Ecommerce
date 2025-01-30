import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductCategoryByIdRepo{
  Future<Either<Failure, List<ProductEntity>>> getProductByCategoryId();
}