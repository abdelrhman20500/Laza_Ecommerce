import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildProductByCategoryId extends StatelessWidget {
  const BuildProductByCategoryId({super.key, required this.image, required this.name, required this.description, required this.price});


  final String image;
  final String name;
  final String description;
  final String price;
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
                  child: AspectRatio(
                    aspectRatio: 1.6/2,
                    child:CachedNetworkImage(
                      imageUrl: "$baseUrl$image",
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
            Text(name,
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w600,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
            Text(description,
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w400,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Text("\$$price", style: const TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.w600,),),
                const Spacer(),
                const Text("(3.4)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                const Icon(Icons.star, color: Colors.yellow,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

