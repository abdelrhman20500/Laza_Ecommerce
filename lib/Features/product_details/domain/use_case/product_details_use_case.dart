import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/product_details/domain/repo/product_details_repo.dart';

class ProductDetailsUseCase extends UseCase<ProductEntity, String> {
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsUseCase(this.productDetailsRepo);

  @override
  Future<Either<Failure, ProductEntity>> call([String? productId]) async {
    return await productDetailsRepo.getProductDetailsRepo(productId: productId!);
  }
}
