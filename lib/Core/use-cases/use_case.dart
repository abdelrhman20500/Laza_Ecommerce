import 'package:dartz/dartz.dart';
import '../utils/failure.dart';


/// generic use case...
abstract class UseCase<Type, Param>{
  Future<Either<Failure,Type>> call([Param param]);
}

/// use case not contain parameter...
class NoParam{}