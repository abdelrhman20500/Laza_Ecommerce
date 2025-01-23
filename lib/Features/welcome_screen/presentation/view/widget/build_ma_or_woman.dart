import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/login_social/presentation/view/login_social.dart';

class BuildManOrWoman extends StatelessWidget {
  const BuildManOrWoman({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            const Text("Look Good, Feel Good", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            const Text("Create your individual & unique style and\n              look amazing everyday.",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, color: Colors.grey,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextButton(onPressed: (){}, child: const Text("Man",
                    style: TextStyle(color: Colors.black),)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff9775FA),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextButton(onPressed: (){}, child: const Text("Woman",
                    style: TextStyle(color: Colors.black),)),
                )
              ],
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, LoginSocial.routeName);
            }, child: const Text("Skip", style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600
            ),))
          ],
        ),
      ),
    );
  }
}
