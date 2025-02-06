import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/review/domain/entities/review_entity.dart';
import 'package:laza_e_commerce/Features/review/domain/repo/all_review_repo.dart';

class AllReviewsUseCase extends UseCase<List<ReviewEntity>, String>{
  final AllReviewsRepo allReviewsRepo;

  AllReviewsUseCase( this.allReviewsRepo);
  @override
  Future<Either<Failure, List<ReviewEntity>>> call([String? productId])async{
    print(SharedPref.getToken());
    return await allReviewsRepo.getReviews(token:SharedPref.getToken().toString(), productId: productId!);
  }
}
