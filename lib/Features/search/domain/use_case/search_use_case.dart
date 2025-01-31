import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'package:laza_e_commerce/Features/search/domain/repo/search_repo.dart';

class SearchUseCase extends UseCase<List<ProductEntity>, String>{

  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call([String? name]) async{
    return await searchRepo.searchProduct(name: name!);
  }
}