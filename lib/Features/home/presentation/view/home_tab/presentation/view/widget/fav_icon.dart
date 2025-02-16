import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/add_fav_cubit/add_fav_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/delete_fav_cubit/delete_fav_cubit.dart';
import '../../view_manager/add_fav_cubit/add_fav_state.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({
    super.key,
    required this.title,
    required this.image,
    required this.id,
    required this.price,
  });

  final String title;
  final String image;
  final String id;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2, right: 2,
      child: BlocBuilder<AddFavCubit, AddFavState>(
        builder: (context, state) {
          final isFavorite = BlocProvider.of<AddFavCubit>(context).isFavorite(id);
          return IconButton(
            onPressed: () {
              if (isFavorite) {
                BlocProvider.of<DeleteFavCubit>(context).deleteFavorites(
                  productId: id,
                  name: title,
                  image: image,
                  price: price,
                ).then((_) {
                  BlocProvider.of<AddFavCubit>(context).removeFavorite(id);
                });
              } else {
                BlocProvider.of<AddFavCubit>(context).addFavorites(
                  productId: id,
                  name: title,
                  image: image,
                  price: price,
                );
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}
