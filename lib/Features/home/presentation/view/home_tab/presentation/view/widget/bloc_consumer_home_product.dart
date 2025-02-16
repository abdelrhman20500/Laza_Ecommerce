import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/delete_fav_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_local_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/data_sources/product_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/repos/delete_fav_repo_impl.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/repos/product_repo_impl.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/use_cases/delete_fav_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/use_cases/product_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/delete_fav_cubit/delete_fav_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/product_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/product_state.dart';
import '../../../data/data_sources/add_fav_remote_data_source.dart';
import '../../../data/repos/add_fav_repo_impl.dart';
import '../../../domain/use_cases/add_fav_use_case.dart';
import '../../view_manager/add_fav_cubit/add_fav_cubit.dart';
import 'grid_view_home_product.dart';

class BlocConsumerHomeProduct extends StatelessWidget {
  const BlocConsumerHomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedProductsCubit(
          ProductUseCase(
            ProductRepoImpl(
              productRemoteDateSource: ProductRemoteDateSourceImpl(ApiService(Dio())),
              productLocalDataSource: ProductLocalDataSourceImpl(),
            ),
          ),
        )..fetchFeaturedProducts(),),
        BlocProvider(create: (context) => AddFavCubit(AddFavUseCase(AddFavRepoImpl(
          addFavRemoteDataSource: AddFavRemoteDataSourceImpl(ApiService(Dio(),),),),),),),
        BlocProvider(create: (context)=>DeleteFavCubit(DeleteFavUseCase(DeleteFavRepoImpl(
            deleteFavRemoteDataSource: DeleteFavRemoteDataSourceImpl(ApiService(Dio()))))))
      ],
      child: BlocBuilder<FeaturedProductsCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is ProductSuccess) {
            return GridViewHomeProduct(model: state.product);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
