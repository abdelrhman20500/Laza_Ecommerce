import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/use_cases/product_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/product_state.dart';

class FeaturedProductsCubit extends Cubit<ProductState> {
  FeaturedProductsCubit(this.productUseCase): super(ProductInitial());

  final ProductUseCase productUseCase;
  Future<void> fetchFeaturedProducts() async {
    emit(ProductLoading());
    var result = await productUseCase.call();
    result.fold((failure) {
      emit(ProductFailure(failure.errMessage));
    }, (product) {
      emit(ProductSuccess(product));
    });
  }
}
