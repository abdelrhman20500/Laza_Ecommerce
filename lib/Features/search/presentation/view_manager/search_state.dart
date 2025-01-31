import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class SearchState{}
class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}

class SearchSuccess extends SearchState{
  final List<ProductEntity> product;

  SearchSuccess(this.product);
}
class SearchFailure extends SearchState{
  final String errMessage;

  SearchFailure(this.errMessage);
}
