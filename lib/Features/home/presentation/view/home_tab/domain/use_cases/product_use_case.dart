import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/repos/product_repo.dart';

class ProductUseCase extends UseCase<List<ProductEntity>, NoParam>{
  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([NoParam? param]) async{
    return await productRepo.fetchProduct();
  }
}