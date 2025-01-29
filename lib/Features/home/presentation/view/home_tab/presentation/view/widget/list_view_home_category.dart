import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/models/category_model.dart';

import 'build_home_category.dart';

class ListViewHomeCategory extends StatelessWidget {
  ListViewHomeCategory({super.key,});

  final List<CategoryModel> mode=[
    CategoryModel(id: "1", name: "Adidas", image: "assets/images/adidas.png"),
    CategoryModel(id: "2", name: "Nike", image: "assets/images/nike.png"),
    CategoryModel(id: "3", name: "FILA", image: "assets/images/fila.png"),

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mode.length,
        itemBuilder: (context, index) {
          return BuildHomeCategory(
            title: mode[index].name,
            image: mode[index].image,
            id: mode[index].id,
          );
        },
      ),
    );
  }
}
