import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/search/domain/entity/search_entity.dart';
import 'package:laza_e_commerce/Features/search/presentation/view/widget/build_search_result.dart';


class GridViewSearchResult extends StatelessWidget {
  const GridViewSearchResult({super.key, required this.model});

  final List<SearchEntity> model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.1/ 4.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return BuildSearchResult(
            image: model[index].productImage,
            name: model[index].productName,
            description: model[index].productDescription,
            price: model[index].productPrice.toString() ?? "0.0", // Ensure to convert price to String
          );
        },
      ),
    );
  }

}
