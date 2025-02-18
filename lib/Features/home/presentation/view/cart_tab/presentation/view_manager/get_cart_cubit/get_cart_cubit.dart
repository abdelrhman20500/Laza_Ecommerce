import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/use_case/get_cart_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view_manager/get_cart_cubit/get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState>{
  GetCartCubit(this.getCartUseCAse): super(GetCartInitial());
  final GetCartUseCAse getCartUseCAse;

  Future<void> fetchCart() async {
    emit(GetCartLoading());
    var result = await getCartUseCAse.call();
    print('API response: $result');
    result.fold((failure) {
      print('cubit fail ${failure.errMessage}');
      emit(GetCartFailure(errMessage: failure.toString()));
    }, (products) {
      print('cart $products');
      if (products.items.isEmpty) {
        emit(GetCartEmpty());
      } else {
        emit(GetCartSuccess(products));
      }
    });
  }
}