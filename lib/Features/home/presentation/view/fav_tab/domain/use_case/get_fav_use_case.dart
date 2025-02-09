import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/domain/repo/get_fav_repo.dart';

import '../../../../../../../Core/utils/failure.dart';
import '../../../home_tab/domain/entities/product_entity.dart';

class FetchWishlistUseCase extends UseCase<List<ProductEntity>, String> {
  final GetFavRepo getFavRepo;

  FetchWishlistUseCase({required this.getFavRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";
    return await getFavRepo.getWishlist(
      token: token,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
