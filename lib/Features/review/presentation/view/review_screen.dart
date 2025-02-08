import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/add_review.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/widget/build_app_bar_reviews.dart';
import '../../../../Core/functions/api_service.dart';
import '../../../product_details/presentation/view/widget/review_card.dart';
import '../../data/data_source/all_reviews_remote_data_source.dart';
import '../../data/repo/all_reviews_impl.dart';
import '../../domain/use_case/all_reviews_use_case.dart';
import '../view_manager/All_Review/all_reviews_cubit.dart';
import '../view_manager/All_Review/all_reviews_state.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  static const String routeName = "ReviewScreen";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final String? productId =
        ModalRoute.of(context)!.settings.arguments as String?;
    // print("Product ID: $productId");

    return Scaffold(
      appBar: const BuildAppBarReviews(title: "Reviews"),
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
                    const Text(
                      "245 Reviews",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
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
                  onTap: () {
                    Navigator.pushNamed(context, AddReview.routeName, arguments: productId);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF7043),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
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
            SizedBox(height: height * 0.02),
            BlocProvider(
              create: (context) => AllReviewsCubit(AllReviewsUseCase(AllReviewsImpl(
                  allReviewsRemoteDataSource:AllReviewsRemoteDataSourceImpl(ApiService(Dio(),),),),),
              )..fetchAllReviews(productId: productId.toString()),
              child: BlocBuilder<AllReviewsCubit, AllReviewsState>(
                builder: (context, state) {
                  if (state is AllReviewsSuccess) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.reviews.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ReviewCard(
                            userName: state.reviews[index].name,
                            feedback: state.reviews[index].feedback,
                            rating: state.reviews[index].rating,
                            ),
                          );
                        });
                  } else if (state is AllReviewsEmpty) {
                    return const Center(child: Text('There is no reviews yet!'));
                  } else if (state is AllReviewsFailure) {
                    return Text(state.errMessage);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
