import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';

abstract class GetFavState {}

final class GetFavInitial extends GetFavState {}

final class GetFavLoading extends GetFavState {}

final class GetFavSuccess extends GetFavState {
  final List<ProductEntity> product;

  GetFavSuccess(this.product);
}

final class GetFavFailure extends GetFavState {
  final String errMessage;
  GetFavFailure(this.errMessage);
}
