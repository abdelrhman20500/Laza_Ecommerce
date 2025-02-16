// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../domain/use_cases/add_fav_use_case.dart';
// import 'add_fav_state.dart';
//
// class AddFavCubit extends Cubit<AddFavState> {
//   final AddFavUseCase addFavUseCase;
//   final List<String> favoriteProductIds = [];
//
//   AddFavCubit(this.addFavUseCase) : super(AddFavInitial());
//
//   Future<void> addFavorites({
//     required String productId,
//     required String name,
//     required String image,
//     required double price,
//   }) async {
//     emit(AddFavLoading());
//     try {
//       await addFavUseCase.call(WishlistParams(productId: productId, name: name, image: image, price: price));
//       favoriteProductIds.add(productId);
//       emit(AddFavSuccess());
//     } catch (e) {
//       emit(AddFavFailure(e.toString()));
//     }
//   }
//
//   bool isFavorite(String productId) {
//     return favoriteProductIds.contains(productId);
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/use_cases/add_fav_use_case.dart';
import 'add_fav_state.dart';


class AddFavCubit extends Cubit<AddFavState> {
  final AddFavUseCase addFavUseCase;
  final List<String> favoriteProductIds = [];

  AddFavCubit(this.addFavUseCase) : super(AddFavInitial()) {
    _loadFavorites();
  }

  Future<void> addFavorites({
    required String productId,
    required String name,
    required String image,
    required double price,
  }) async {
    emit(AddFavLoading());
    try {
      await addFavUseCase.call(WishlistParams(productId: productId, name: name, image: image, price: price));
      favoriteProductIds.add(productId);
      await _saveFavorites();
      emit(AddFavSuccess());
    } catch (e) {
      emit(AddFavFailure(e.toString()));
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

  Future<void> removeFavorite(String productId) async {
    favoriteProductIds.remove(productId);
    await _saveFavorites();
    emit(AddFavInitial());
  }
}
