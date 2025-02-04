import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/functions/api_service.dart';
import '../../../data/data_source/product_details_remote_data_source.dart';
import '../../../data/repo/product_details_repo_impl.dart';
import '../../../domain/use_case/product_details_use_case.dart';
import '../../view_manager/product_details_cubit.dart';
import '../../view_manager/product_details_state.dart';
import '../product_details.dart';

class ProductDetailsBlocConsumer extends StatelessWidget {
  const ProductDetailsBlocConsumer({super.key, this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(ProductDetailsUseCase(ProductDetailsRepoImpl(
          productDetailsRemoteDataSource: ProductDetailsRemoteDataSourceImpl(ApiService(Dio())),
        )))
          ..fetchProductDetails( productId: productId.toString()), // Ensure product details are fetched
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsFailure) {
              return Center(child: Text(state.errMessage));
            } else if (state is ProductDetailsSuccess) {
              List<String> imageUrls = state.product.images?.map((image) => image.image ?? '').toList() ?? [];
              return ProductDetailsScreen(
                 id: state.product.id!,
                images: imageUrls,
                name: state.product.name!,
                image: state.product.image!,
                price: state.product.price!.toDouble().toString(),
                description: state.product.description!,
              ); // Pass product data to ProductDetailsScreen
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
