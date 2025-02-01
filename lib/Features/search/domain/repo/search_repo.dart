import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<SearchEntity>>> searchProduct({required String query});
}