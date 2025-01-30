import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductCategoryByIdState{}
class ProductCategoryByIdInitial extends ProductCategoryByIdState{}
class ProductCategoryByIdLoading extends ProductCategoryByIdState{}

class ProductCategoryByIdSuccess extends ProductCategoryByIdState{
  final List<ProductEntity> product;

  ProductCategoryByIdSuccess(this.product);
}
class ProductCategoryByIdFailure extends ProductCategoryByIdState{
  final String errMessage;

  ProductCategoryByIdFailure(this.errMessage);
}
