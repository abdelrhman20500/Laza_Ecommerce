import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/widget/build_fav_product.dart';

class GridViewFavProduct extends StatelessWidget {
  const GridViewFavProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.1/ 4.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const BuildFavProduct();
        },
      ),
    );
  }
}
