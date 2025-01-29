import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildHomeProduct extends StatelessWidget {
  const BuildHomeProduct({super.key, required this.image, required this.name, required this.description, required this.price});

  final String image;
  final String name;
  final String description;
  final String price;
  final String baseUrl = 'https://laza.runasp.net/';

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
                AspectRatio(
                  aspectRatio: 1.1,
                  child:CachedNetworkImage(
                    imageUrl: "$baseUrl$image",
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
            Text(name,
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w500,),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Text(description,
              style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w500,),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
             Text("\$$price", style: const TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.w600,),
            ),
          ],
        ),
      ),
    );
  }
}
