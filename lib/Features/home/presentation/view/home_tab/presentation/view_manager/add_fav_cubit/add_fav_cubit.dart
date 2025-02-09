import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/add_fav_use_case.dart';
import 'add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  final AddFavUseCase addFavUseCase;

  AddFavCubit(this.addFavUseCase) : super(AddFavInitial());

  Future<void> addFavorites({
    required String productId,
    required String name,
    required String image,
    required double price,
  }) async {
    emit(AddFavLoading());
    try {
      await addFavUseCase.call(WishlistParams(productId: productId, name: name, image: image, price: price));
      emit(AddFavSuccess());
    } catch (e) {
      emit(AddFavFailure(e.toString()));
    }
  }
}