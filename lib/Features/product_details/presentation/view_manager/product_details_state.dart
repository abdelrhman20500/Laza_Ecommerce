
import '../../../home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}

class ProductDetailsSuccess extends ProductDetailsState{
  final ProductEntity product;

  ProductDetailsSuccess(this.product);
}
class ProductDetailsFailure extends ProductDetailsState{
  final String errMessage;

  ProductDetailsFailure(this.errMessage);
}
