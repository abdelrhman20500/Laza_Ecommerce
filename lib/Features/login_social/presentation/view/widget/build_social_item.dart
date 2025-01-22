import 'package:flutter/material.dart';

class BuildSocialItem extends StatelessWidget {
  const BuildSocialItem({super.key, required this.color, required this.title, required this.icon,});

  final Color color;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration:  BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 26,color: Colors.white,),
            const SizedBox(width: 12,),
            Text(title,
              style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
