import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/entities/product_entity.dart';
import 'build_product_by_category_id.dart';


class ProductByCategoryIdGridView extends StatelessWidget {
  const ProductByCategoryIdGridView({super.key, required this.product});

  final List<ProductEntity> product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.1/ 4.0,
      ),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return BuildProductByCategoryId(
          image: product[index].image ?? "",
          name: product[index].name ?? "",
          description: product[index].description ?? "",
          price: product[index].price?.toString() ?? "0.0",
        );
      },
    );
  }
}
