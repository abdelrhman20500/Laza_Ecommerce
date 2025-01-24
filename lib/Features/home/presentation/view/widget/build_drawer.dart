import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyan,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mrh Raju", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                    Text("Verified Profile", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),

                  ],
                ),
                Text("3 order", style: TextStyle(color: Colors.grey),)
              ],
            )
          ),
          const ItemInDrawer(icon: Icons.info_outline, title: "Account information"),
          const ItemInDrawer(icon: Icons.lock_clock_outlined,title: "Password",),
          const ItemInDrawer(icon: Icons.reorder,title: "Order",),
          const ItemInDrawer(icon: Icons.card_giftcard, title: "My Card"),
          const ItemInDrawer(icon: Icons.favorite_border, title: "WishList"),
          const ItemInDrawer(icon: Icons.settings, title: "Settings"),
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          const Logout(icon: Icons.logout, title: "Logout"),
        ],
      ),
    );
  }
}

class ItemInDrawer extends StatelessWidget {
  const ItemInDrawer({super.key, required this.icon, required this.title,});

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(icon, size: 28,),
      title:  Text(title, style: const TextStyle(fontSize:18 ,fontWeight: FontWeight.w500),),
      onTap: () {},
    );
  }
}
class Logout extends StatelessWidget {
  const Logout({super.key, required this.icon, required this.title,});

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(icon, size: 30,color: Colors.red,),
      title:  Text(title, style: const TextStyle(color: Colors.red,fontSize:20 ,fontWeight: FontWeight.w500),),
      onTap: () {},
    );
  }
}