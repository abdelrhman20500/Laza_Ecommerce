import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view/widget/build_item_cart.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         itemCount: 6,
        itemBuilder: (context, index) {
      return const BuildItemCart();
    });
  }
}

