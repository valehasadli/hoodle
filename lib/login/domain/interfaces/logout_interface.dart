import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';

abstract class LogoutInterface {
  Future<Either<Failure, void>> logout();
}
