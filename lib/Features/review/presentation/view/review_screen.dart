import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/add_review.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/build_all_reviews.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/build_app_bar_reviews.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  static const String routeName= "ReviewScreen";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BuildAppBarReviews(title: "Reviews",),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text("245 Reviews", style: TextStyle(fontWeight: FontWeight.w500),),
                   Row(
                     children: [
                       const Text("4.8"),
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
                   )
                 ],
               ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AddReview.routeName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF7043),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.edit_note,
                          color: Colors.white,
                        ),
                        Text(
                          'Add Review',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            const BuildAllReviews(),
          ],
        ),
      ),
    );
  }
}

