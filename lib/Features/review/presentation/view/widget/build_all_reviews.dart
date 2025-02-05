import 'package:flutter/material.dart';

import '../../../../product_details/presentation/view/widget/review_card.dart';

class BuildAllReviews extends StatelessWidget {
  const BuildAllReviews({super.key,});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index)
          {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ReviewCard(),
            );
          }
      ),
    );
  }
}
