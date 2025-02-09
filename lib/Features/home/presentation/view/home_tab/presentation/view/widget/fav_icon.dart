import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view_manager/add_fav_cubit/add_fav_cubit.dart';

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
      top: 2,
      right: 2,
      child: IconButton(
        onPressed: () {
          // print("Adding to favorites...");
          BlocProvider.of<AddFavCubit>(context).addFavorites(
            productId: id,
            name: title,
            image: image,
            price: price,
          );
          // print("Added to favorites!");
        },
        icon: const Icon(Icons.favorite_border, color: Colors.grey, size: 30),
      ),
    );
  }
}