import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/search/presentation/view/widget/build_custom_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const String routeName= "SearchScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text("Search Product", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const BuildCustomSearch(name: "Search....", iconData: Icons.search),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

        ],
      ),
    );
  }
}
