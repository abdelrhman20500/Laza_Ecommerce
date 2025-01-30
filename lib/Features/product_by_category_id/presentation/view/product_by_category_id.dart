import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/presentation/view/widget/product_by_category_id_grid_view.dart';
import '../../../../Core/functions/api_service.dart';
import '../../data/data_source/product_by_category_id_remote_data_source.dart';
import '../../data/repo/product_category_by_id_repo_impl.dart';
import '../../domain/use_case/product_category_by_id_use_case.dart';
import '../view_manager/product_category_by_id_cubit.dart';
import '../view_manager/product_category_by_id_state.dart';

class ProductByCategoryId extends StatelessWidget {
  const ProductByCategoryId({
    super.key,
    required this.categoryId, required this.image,
  });

  static const String routeName = "ProductByCategoryId";
  final String categoryId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCategoryByIdCubit(
          ProductCategoryByIdUseCase(
            ProductCategoryByIdRepoImpl(
              productByCategoryIdRemoteDataSource:
              ProductByCategoryIdRemoteDataSourceImpl(
                ApiService(Dio()),
              ),
            ),
          ),
        )..fetchProductCategoryId(categoryId: categoryId),
        child: BlocConsumer<ProductCategoryByIdCubit, ProductCategoryByIdState>(
          listener: (context, state) {
            if(state is ProductCategoryByIdSuccess)
              {
                // print( state.product);
              }else if (state is ProductCategoryByIdFailure) {
              // Show a SnackBar for errors
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }else if(state is ProductCategoryByIdLoading)
              {
                const Center(child: CircularProgressIndicator());
              }
          },
          builder: (context, state) {
            if (state is ProductCategoryByIdSuccess) {
              // Success state: Display the grid view
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                        ),
                        Image(
                          image: AssetImage(image),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.1,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_bag_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ProductByCategoryIdGridView(
                      product: state.product,
                    ),
                  ),
                ],
              );
            } else if (state is ProductCategoryByIdFailure) {
              // Failure state: Display an error message
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              );
            } else {
              // Loading state: Display a loading indicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}