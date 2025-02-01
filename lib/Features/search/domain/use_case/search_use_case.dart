import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';
import 'package:laza_e_commerce/Features/search/domain/repo/search_repo.dart';

class SearchUseCase extends UseCase<List<SearchEntity>, String>{

  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<SearchEntity>>> call([String? query]) async{
    return await searchRepo.searchProduct(query: query!);
  }
}