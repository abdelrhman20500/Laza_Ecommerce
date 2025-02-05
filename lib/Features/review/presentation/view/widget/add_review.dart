import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';
import 'build_app_bar_reviews.dart';
import 'custom_text_field_review.dart';

class AddReview extends StatelessWidget {
  AddReview({super.key});
  static const String routeName = "AddReview";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BuildAppBarReviews(title: "Add Review",),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name", style: TextStyle(fontSize: 22),),
                SizedBox(height: height * 0.02,),
                CustomTextFieldReview(controller: nameController, hintText: "type your name"),
                SizedBox(height: height * 0.05,),
                const Text("How was your experience ?", style: TextStyle(fontSize: 22),),
                SizedBox(height: height * 0.02,),
                CustomTextFieldReview(controller: descriptionController, hintText: "Describe your experience?"),
                SizedBox(height: height * 0.05,), // Add spacing before the rating bar
                const Text("Rating ", style: TextStyle(fontSize: 22),),
                SizedBox(height: height * 0.02,),
                Center(
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                ),
                SizedBox(height: height *0.3,), // Add spacing before the rating bar
                CustomButton(text: "Submit Review",height:66,width: double.infinity,color: const Color(0xff9775FA), onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
