import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/review/presentation/view_manager/Add_review/add_review_cubit.dart';
import 'package:laza_e_commerce/Features/review/presentation/view_manager/Add_review/add_review_state.dart';
import 'custom_text_field_review.dart';
import 'build_app_bar_reviews.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';

class AddReview extends StatelessWidget {
  AddReview({super.key});
  static const String routeName = "AddReview";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? rate;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final String? productId = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: const BuildAppBarReviews(title: "Add Review"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name", style: TextStyle(fontSize: 22)),
                SizedBox(height: height * 0.02),
                CustomTextFieldReview(controller: nameController, hintText: "Type your name"),
                SizedBox(height: height * 0.05),
                const Text("How was your experience?", style: TextStyle(fontSize: 22)),
                SizedBox(height: height * 0.02),
                CustomTextFieldReview(controller: descriptionController, hintText: "Describe your experience?"),
                SizedBox(height: height * 0.05),
                const Text("Rating", style: TextStyle(fontSize: 22)),
                SizedBox(height: height * 0.02),
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
                      rate = rating;
                    },
                  ),
                ),
                SizedBox(height: height * 0.3),
                BlocProvider(
                  create: (context) => AddReviewCubit(api: Api(dio: Dio())),
                  child: BlocConsumer<AddReviewCubit, AddReviewState>(
                    listener: (context, state) {
                      if (state is AddReviewSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Review added successfully!")));
                      } else if (state is AddReviewFailure) {
                        print(state.errMessage);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${state.errMessage}")));
                      }
                    },
                    builder: (context, state) {
                      if (state is AddReviewLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButton(
                        text: "Submit Review",
                        height: 66,
                        width: double.infinity,
                        color: const Color(0xff9775FA),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final token = SharedPref.getToken(); // الحصول على التوكن
                            print("Token => $token");
                            final cubit = context.read<AddReviewCubit>();
                            cubit.addReview(
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I",
                              userName: nameController.text,
                              rating: rate?.toString() ?? "0",
                              feedBack: descriptionController.text,
                              productId: productId.toString(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}