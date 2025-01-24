import 'package:flutter/material.dart';

import 'build_home_category.dart';

class ListViewHomeCategory extends StatelessWidget {
  const ListViewHomeCategory({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const BuildHomeCategory();
        },
      ),
    );
  }
}
