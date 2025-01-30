import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/domain/use_case/product_category_by_id_use_case.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/presentation/view_manager/product_category_by_id_state.dart';

class ProductCategoryByIdCubit extends Cubit<ProductCategoryByIdState>{
  ProductCategoryByIdCubit(this.productCategoryByIdUseCase) :super(ProductCategoryByIdInitial());
  final ProductCategoryByIdUseCase productCategoryByIdUseCase;
  Future<void> fetchProductCategoryId({required String categoryId}) async {
    emit(ProductCategoryByIdLoading());
    var result = await productCategoryByIdUseCase.call(categoryId);
    result.fold((failure) {
      emit(ProductCategoryByIdFailure(failure.errMessage));
    }, (product) {
      emit(ProductCategoryByIdSuccess(product));
    });
  }
}