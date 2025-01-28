import 'package:flutter/material.dart';
import 'build_home_product.dart';

class GridViewHomeProduct extends StatelessWidget {
  const GridViewHomeProduct({super.key,});


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.1 / 3.7,
      ),
      itemCount: 6, // Adjust the item count as needed
      itemBuilder: (context, index) {
        return const BuildHomeProduct();
      },
    );
  }
}
