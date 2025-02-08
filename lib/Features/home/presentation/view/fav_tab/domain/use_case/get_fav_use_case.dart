import 'package:dartz/dartz.dart';
import 'package:laza_e_commerce/Core/use-cases/use_case.dart';
import 'package:laza_e_commerce/Core/utils/failure.dart';
import 'package:laza_e_commerce/Core/utils/shared_preferences.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/fav_tab/domain/repo/get_fav_repo.dart';
import '../../../home_tab/domain/entities/product_entity.dart';

class GetFavUseCase extends UseCase<List<ProductEntity>, String>{
  final GetFavRepo getFavRepo;

  GetFavUseCase(this.getFavRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call([String? param])async{
    return await getFavRepo.getFavorites(token: SharedPref.getToken().toString());
  }
}