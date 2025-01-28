import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}

class ProductSuccess extends ProductState{
  final List<ProductEntity> product;

  ProductSuccess(this.product);
}
class ProductFailure extends ProductState{
  final String errMessage;

  ProductFailure(this.errMessage);
}
