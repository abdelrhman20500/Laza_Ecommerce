import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/product_by_category_id/presentation/view/widget/product_by_category_id_grid_view.dart';

class ProductBuCategoryId extends StatelessWidget {
  const ProductBuCategoryId({super.key});
  static const String routeName = "ProductBuCategoryId";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: const AssetImage("assets/images/adidas.png"),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.1,
          fit: BoxFit.fill,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: const ProductByCategoryIdGridView(),
    );
  }
}
