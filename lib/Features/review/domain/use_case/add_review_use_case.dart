import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/review/domain/repo/add_review_repo.dart';

import '../../../../Core/utils/failure.dart';

class AddReviewUseCase extends UseCase<void,AddReviewParams >{
  final AddReviewRepo addReviewRepo;

  AddReviewUseCase(this.addReviewRepo);

  @override
  Future<Either<Failure, void>> call([AddReviewParams? addParams])async {
   return await addReviewRepo.addReview(
       token: SharedPref.getToken().toString(),
     productId: addParams!.productId,
     name: addParams.name,
     feedback: addParams.feedback,
     rate: addParams.rate,
   );
  }
}

class AddReviewParams {
  final String productId, name, feedback;
  final double rate;

  AddReviewParams({
    required this.productId,
    required this.name,
    required this.feedback,
    required this.rate,
  });
}