import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key,});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurpleAccent,
            ),
            const SizedBox(width: 8),
            const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("Abdelrhman",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text('25 Nov, 2024', style: TextStyle(fontSize: 12, color: Colors.grey),),
            ]),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "4.8",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black)),
                      TextSpan(
                          text: 'rating',
                          style: TextStyle(
                            color: Colors.grey,
                          ))
                    ])),
                RatingBarIndicator(
                  rating: 4,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height*0.02,),
        const Text("The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..",
          maxLines: 3,overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, color: Colors.grey),),
      ],
    );
  }
}
