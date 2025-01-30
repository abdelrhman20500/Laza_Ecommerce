import 'package:flutter/material.dart';
import 'build_product_by_category_id.dart';


class ProductByCategoryIdGridView extends StatelessWidget {
  const ProductByCategoryIdGridView({super.key});


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
      itemCount: 12,
      itemBuilder: (context, index) {
        return const BuildProductByCategoryId();
      },
    );
  }
}
