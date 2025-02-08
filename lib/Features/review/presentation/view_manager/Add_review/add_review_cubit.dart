import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/add_review_model.dart';
import 'add_review_state.dart';

class Api {
  final Dio dio;
  Api({required this.dio});

  Future<AddReviewModel> addReview(String? token, {required String userName, required String rating,
    required String feedBack, required String productId}) async {
    final String url = "https://laza.runasp.net/api/Review/AddReview/$productId";
    print("API POST Request: $url");

    final data = jsonEncode({
      "Rating": rating,
      "Username": userName,
      "Feedback": feedBack,
    });
    print("Request Data: $data");

    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
        }),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null) {
          Map<String, dynamic> jsonData = response.data;
          return AddReviewModel.fromJson(jsonData);
        } else {
          throw Exception("Empty response body");
        }
      } else {
        throw Exception("Something went wrong: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Failed to add review: ${e.toString()}");
    }
  }
}

class AddReviewCubit extends Cubit<AddReviewState> {
  final Api api;

  AddReviewCubit({required this.api}) : super(AddReviewInitial());

  Future<void> addReview(String? token, {required String userName, required String rating, required String feedBack, required String productId}) async {
    emit(AddReviewLoading());
    try {
      final AddReviewModel review = await api.addReview(token, userName: userName, rating: rating, feedBack: feedBack, productId: productId);
      emit(AddReviewSuccess(review));
    } catch (e) {
      emit(AddReviewFailure( errMessage: e.toString()));
    }
  }
}