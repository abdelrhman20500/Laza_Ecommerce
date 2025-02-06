import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.userName, required this.feedback, required this.rating,});

  final String userName;
  final String feedback;
  final double rating;
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
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(userName,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const Text('25 Nov, 2024', style: TextStyle(fontSize: 12, color: Colors.grey),),
            ]),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text:TextSpan(children: [
                      TextSpan(
                          text:rating.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black)),
                      const TextSpan(
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
        Text(feedback,
          maxLines: 3,overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, color: Colors.grey),),
      ],
    );
  }
}
