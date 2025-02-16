import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/use_case/add_cart_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view_manager/add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState>{
  AddCartCubit(this.addCartUseCase): super(AddCartInitial());
  final AddCartUseCase addCartUseCase;

  Future<void> addCart({required String productId}) async {
    emit(AddCartLoading());
    var result = await addCartUseCase.call(productId);
    result.fold((failure) {
      print('add cart ${failure.errMessage}');
      emit(AddCartFailure(errMessage: failure.toString()));
    }, (_) async {
      print('add cubit success');
      emit(AddCartSuccess());
    });
  }
}