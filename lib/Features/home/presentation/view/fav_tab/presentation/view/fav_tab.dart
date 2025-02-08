import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/data/data_source/get_fav_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/data/repo/get_fav_repo_impl.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/domain/use_case/get_fav_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view/widget/grid_view_fav_product.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_state.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => GetFavCubit(FetchWishlistUseCase(getFavRepo: GetFavRepoImpl(
              getFavRemoteDataSource: GetFavRemoteDataSourceImpl(ApiService(Dio()))))
          )..fetchWishlist(),
          child: BlocConsumer<GetFavCubit, GetFavState>(
            listener: (BuildContext context, GetFavState state) {
              if (state is GetFavFailure) {
                // print(state.errMessage);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
            builder: (context, state) {
              if (state is GetFavEmpty) {
                return const Center(child: Text("Favorites Empty"));
              } else if (state is GetFavSuccess) {
                return GridViewFavProduct(model: state.wishlist);
              } else if (state is GetFavEmpty) {
                return const Center(child: Text("No fav"));
              } else if (state is GetFavFailure) {
                return Center(child: Text(state.errMessage));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
