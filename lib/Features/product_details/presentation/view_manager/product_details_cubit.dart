import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/product_details/domain/use_case/product_details_use_case.dart';
import 'package:laza_e_commerce/Features/product_details/presentation/view_manager/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  ProductDetailsCubit(this.productDetailsUseCase) :super(ProductDetailsInitial());
  final ProductDetailsUseCase productDetailsUseCase;
  Future<void> fetchProductDetails({required String productId}) async {
    emit(ProductDetailsLoading());
    var result = await productDetailsUseCase.call(productId);
    result.fold((failure) {
      emit(ProductDetailsFailure(failure.errMessage));
    }, (product) {
      emit(ProductDetailsSuccess(product));
    });
  }
}