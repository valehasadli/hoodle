import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';

abstract class TokenInterface {
  Future<Either<Failure, bool>> tokenStatus();
}
