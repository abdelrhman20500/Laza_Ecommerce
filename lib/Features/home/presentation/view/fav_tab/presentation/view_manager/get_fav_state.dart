import '../../../home_tab/domain/entities/product_entity.dart';

abstract class GetFavState {}

final class GetFavInitial extends GetFavState {}

final class GetFavLoading extends GetFavState {}

final class GetFavEmpty extends GetFavState {}

final class GetFavSuccess extends GetFavState {
  final List<ProductEntity> wishlist;

  GetFavSuccess(this.wishlist);
}

final class GetFavFailure extends GetFavState {
  final String errMessage;
  GetFavFailure(this.errMessage);
}
