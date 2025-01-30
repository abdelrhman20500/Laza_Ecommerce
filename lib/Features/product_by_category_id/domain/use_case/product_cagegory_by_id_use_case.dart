import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/domain/repo/product_category_by_id_repo.dart';
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

class ProductCategoryByIdUseCase extends UseCase<List<ProductEntity>, String>{
  final ProductCategoryByIdRepo productCategoryByIdRepo;

  ProductCategoryByIdUseCase(this.productCategoryByIdRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call([String? categoryId])async {
    return await productCategoryByIdRepo.getProductByCategoryId(categoryId: categoryId!);
  }

}