import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/domain/repos/add_fav_repo.dart';

class AddFavUseCase extends UseCase<void, WishlistParams>{
  final AddFavRepo addFavRepo;

  AddFavUseCase(this.addFavRepo);
  @override
  Future<Either<Failure, void>> call(WishlistParams param)async{

    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ6aXpvMTNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI1MWQwNmM0ZC0wNGY2LTQyNjgtOTkzOS1lYTdjYzgxNjQzMzkiLCJqdGkiOiI1OTMxZTBmNS1mOTI3LTRhZGYtOWI1ZC1hOGViYWM2YTc0NzYiLCJleHAiOjE3NDA1OTYxMzAsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA5OSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.zyUA93GL-uGSLcZeIkNJR52MQGRWvygqv7tvzaZ335I";
    return await addFavRepo.addFav(
        token: token,
        productId: param.productId,
        image: param.image,
        name: param.name,
        price: param.price
   );
  }
}
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
class WishlistParams {
  final String productId, name, image;
  final double price;

  WishlistParams({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
  });
}