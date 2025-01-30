import 'package:flutter/material.dart';

class BuildProductByCategoryId extends StatelessWidget {
  const BuildProductByCategoryId({super.key});

  final String baseUrl = 'https://laza.runasp.net/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 6, // Blur radius
            offset: const Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: const AspectRatio(
                    aspectRatio: 1.6/2,
                    child:Image(image: AssetImage("assets/images/shirt.png"),
                    fit: BoxFit.cover,)
                  ),
                ),
                Positioned(
                  top: 2,right: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border,color: Colors.grey,size: 30,),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            const Text("Nike Sportswear Club Fleece",
              style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
            const Text("Nike Sportswear Club Fleece Nike Sportswear Club Fleece Nike Sportswear Club Fleece",
              style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            const Row(
              children: [
                Text("\$200", style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.w600,),),
                Spacer(),
                Text("(3.4)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                Icon(Icons.star, color: Colors.yellow,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

