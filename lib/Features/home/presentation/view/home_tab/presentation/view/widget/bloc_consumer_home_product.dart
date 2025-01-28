import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_local_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/repos/product_repo_impl.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/use_cases/product_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/product_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/product_state.dart';

import 'grid_view_home_product.dart';

class BlocConsumerHomeProduct extends StatelessWidget {
  const BlocConsumerHomeProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturedProductsCubit(
        ProductUseCase(
          ProductRepoImpl(
            productRemoteDateSource:
                ProductRemoteDateSourceImpl(ApiService(Dio())),
            productLocalDataSource: ProductLocalDataSourceImpl(),
          ),
        ),
      )..fetchFeaturedProducts(),
      child: BlocConsumer<FeaturedProductsCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductFailure) {
            print(state.errMessage);
            Text(state.errMessage);
          } else if (state is ProductSuccess) {
            // Text(state.product[0].description.toString());
          } else if (state is ProductLoading) {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return const GridViewHomeProduct();
        },
      ),
    );
  }
}
