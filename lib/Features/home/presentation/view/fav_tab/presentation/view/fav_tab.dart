import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view/widget/grid_view_fav_product.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view_manager/get_fav_state.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<GetFavCubit, GetFavState>(
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
      ],
    );
  }
}
