import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/entities/cart_entity.dart';

abstract class GetCartState{}
class GetCartInitial extends GetCartState{}
class GetCartLoading extends GetCartState{}
class GetCartEmpty extends GetCartState {}

class GetCartFailure extends GetCartState{
  final String errMessage;
  GetCartFailure({required this.errMessage});
}

class GetCartSuccess extends GetCartState{
  final CartEntity cartEntity;

  GetCartSuccess(this.cartEntity);
}
