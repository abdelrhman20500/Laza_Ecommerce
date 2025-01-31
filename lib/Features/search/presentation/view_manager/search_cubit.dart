import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/search/domain/use_case/search_use_case.dart';
import 'package:laza_e_commerce/Features/search/presentation/view_manager/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchUseCase) :super(SearchInitial());
  final SearchUseCase searchUseCase;
  Future<void> searchProduct({required String query}) async {
    emit(SearchLoading());
    var result = await searchUseCase.call(query);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (product) {
      emit(SearchSuccess(product));
    });
  }
}