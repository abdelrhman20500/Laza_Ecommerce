import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/use_cases/delete_fav_use_case.dart';
import 'delete_fav_state.dart';

class DeleteFavCubit extends Cubit<DeleteFavState> {
  final DeleteFavUseCase deleteFavUseCase;
  final List<String> favoriteProductIds = [];

  DeleteFavCubit(this.deleteFavUseCase) : super(DeleteFavInitial()) {
    _loadFavorites();
  }

  Future<void> deleteFavorites({
    required String productId,
    required String name,
    required String image,
    required double price,
  }) async {
    emit(DeleteFavLoading());
    try {
      await deleteFavUseCase.call(WishlistParams(productId: productId, name: name, image: image, price: price));
      favoriteProductIds.remove(productId);
      await _saveFavorites();
      emit(DeleteFavSuccess());
    } catch (e) {
      emit(DeleteFavFailure(e.toString()));
    }
  }

  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  Future<void> _saveFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteProductIds', favoriteProductIds);
  }

  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? savedFavorites = prefs.getStringList('favoriteProductIds');
    if (savedFavorites != null) {
      favoriteProductIds.addAll(savedFavorites);
    }
  }
}
