import 'package:flutter/material.dart';

import 'widget/build_drawer.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  static const String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.card_giftcard)),
        ],
      ),
      drawer: const BuildDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff9775FA),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex =index;
            setState(() {});
          },
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card"),
        BottomNavigationBarItem(icon: Icon(Icons.add_chart_sharp), label: "Home"),
      ]),
    );
  }
}

