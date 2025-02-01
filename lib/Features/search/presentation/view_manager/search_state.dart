import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';


abstract class SearchState{}
class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}

class SearchSuccess extends SearchState{
  final List<SearchEntity> product;

  SearchSuccess(this.product);
}
class SearchFailure extends SearchState{
  final String errMessage;

  SearchFailure(this.errMessage);
}
