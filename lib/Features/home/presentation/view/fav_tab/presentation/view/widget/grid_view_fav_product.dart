import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'build_fav_product.dart';

class GridViewFavProduct extends StatelessWidget {
  const GridViewFavProduct({super.key, required this.model});
  final List<ProductEntity> model;

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
          childAspectRatio: 2.4/ 4.0,
        ),
        itemCount: model.length,
        itemBuilder: (context, index) {
          return BuildFavProduct(
            id: model[index].id ?? "",
            image: model[index].image ?? "",
            name: model[index].name ?? "",
            price: model[index].price?.toString() ?? "0.0",
          );
        },
      ),
    );
  }
}
