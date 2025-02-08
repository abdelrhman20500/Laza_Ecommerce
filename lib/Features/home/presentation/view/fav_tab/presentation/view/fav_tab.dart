import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/presentation/view/widget/grid_view_fav_product.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GridViewFavProduct()
      ],
    );
  }
}
