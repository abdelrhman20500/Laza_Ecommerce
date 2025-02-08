import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_state.dart';
import '../../domain/use_case/get_fav_use_case.dart';

class GetFavCubit extends Cubit<GetFavState> {
  final GetFavUseCase getFavUseCase;

  GetFavCubit(this.getFavUseCase) : super(GetFavInitial());

  Future<void> getFavorites() async {
    emit(GetFavLoading());
    var result = await getFavUseCase.call();
    result.fold((e) {
      emit(GetFavFailure(e.toString()));
    }, (product) {
      emit(GetFavSuccess(product));
    });
  }
}
