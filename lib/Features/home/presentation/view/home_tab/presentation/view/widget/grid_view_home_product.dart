import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'build_home_product.dart';

class GridViewHomeProduct extends StatelessWidget {
  const GridViewHomeProduct({super.key, required this.model});

  final List<ProductEntity> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.1/ 4.0,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return BuildHomeProduct(
          image: model[index].image ?? "",
          name: model[index].name ?? "",
          description: model[index].description ?? "",
          price: model[index].price?.toString() ?? "0.0", // Ensure to convert price to String
        );
      },
    );
  }
}
