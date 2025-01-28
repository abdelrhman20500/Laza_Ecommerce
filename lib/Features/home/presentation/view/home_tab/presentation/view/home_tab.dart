import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view/widget/bloc_consumer_home_product.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view/widget/build_home_search.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/presentation/view/widget/list_view_home_category.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hello", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
            SizedBox(height: MediaQuery.of(context).size.height*0.001,),
            const Text("Welcome to Laza.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            const BuildHomeSearch(),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose Brand", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),),
                  Text("view all", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.001,),
            const ListViewHomeCategory(),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            const BlocConsumerHomeProduct(),
          ],
        ),
      ),
    );
  }
}






