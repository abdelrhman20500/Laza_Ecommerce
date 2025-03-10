import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import '../../../../../../../Core/utils/failure.dart';

abstract class ProductRepo{
  Future<Either<Failure, List<ProductEntity>>> fetchProduct();
}