import 'package:flutter/material.dart';

class BuildHomeProduct extends StatelessWidget {
  const BuildHomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                const AspectRatio(
                  aspectRatio: 1.1,
                  child: Image(
                    image: AssetImage("assets/images/shirt.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 2,right: 6,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border,color: Colors.grey,size: 30,),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            const Text("Nike Sportswear Club Fleece",
              style: TextStyle(fontWeight: FontWeight.w500,),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            const Text("\$ 99", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),
            ),
          ],
        ),
      ),
    );
  }
}
