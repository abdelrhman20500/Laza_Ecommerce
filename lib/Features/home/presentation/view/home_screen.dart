import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/cart_tab.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/fav_tab.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/order_tab/order_tab.dart';

import 'home_tab/presentation/view/home_tab.dart';
import 'widget/build_drawer.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  static const String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex=0;
   List<Widget> tabs= [
     const HomeTab(),
     const FavTab(),
     const CartTab(),
     const OrderTab(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Laza", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.card_giftcard)),
        ],
      ),
      drawer: const BuildDrawer(),
      body: tabs[currentIndex],
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
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.wallet_outlined), label: "Orders"),
      ]),
    );
  }
}

