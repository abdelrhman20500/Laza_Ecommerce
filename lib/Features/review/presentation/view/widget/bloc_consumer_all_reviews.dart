// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:laza_e_commerce/Core/functions/api_service.dart';
// import 'package:laza_e_commerce/Features/review/data/data_source/all_reviews_remote_data_source.dart';
// import 'package:laza_e_commerce/Features/review/data/repo/all_reviews_impl.dart';
// import 'package:laza_e_commerce/Features/review/domain/use_case/all_reviews_use_case.dart';
// import 'package:laza_e_commerce/Features/review/presentation/view_manager/All_Review/all_reviews_cubit.dart';
// import 'package:laza_e_commerce/Features/review/presentation/view_manager/All_Review/all_reviews_state.dart';
//
// import 'build_all_reviews.dart';
//
// class BlocConsumerAllReviews extends StatelessWidget {
//   const BlocConsumerAllReviews({super.key, required this.productId,});
//   final String productId;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AllReviewsCubit(AllReviewsUseCase(AllReviewsImpl(
//           allReviewsRemoteDataSource: AllReviewsRemoteDataSourceImpl(ApiService(Dio(),
//           ),),),),
//       )..fetchAllReviews(productId: productId),
//       child: BlocConsumer<AllReviewsCubit, AllReviewsState>(
//           listener: (context, state) {
//             if(state is AllReviewsLoading)
//               {
//                 const Center(child: CircularProgressIndicator(),);
//               }else if(state is AllReviewsFailure)
//                 {
//                   print(state.errMessage);
//                 }else if(state is AllReviewsSuccess)
//                   {
//                     print(state.reviews);
//                   }
//           },
//           builder: (context, state) {
//             return const BuildAllReviews();
//           },
//       ),
//     );
//   }
// }
