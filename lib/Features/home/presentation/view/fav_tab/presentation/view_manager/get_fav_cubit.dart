

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_state.dart';

import '../../../home_tab/domain/entities/product_entity.dart';
import '../../domain/use_case/get_fav_use_case.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit(this.fetchWishlistUseCase) : super(GetFavInitial());

  final FetchWishlistUseCase fetchWishlistUseCase;

  List<ProductEntity> wishlist = [];

  Future<void> fetchWishlist() async {
    var result = await fetchWishlistUseCase.call();
    print(result);
    result.fold((failure) {
      emit(GetFavFailure(failure.errMessage));
    }, (wishList) {
      wishlist = wishList;
      if (wishlist.isEmpty) {
        print("Wishlist is empty");
        emit(GetFavEmpty());
      } else {
        emit(GetFavSuccess(wishlist));
      }
    });
  }
}
