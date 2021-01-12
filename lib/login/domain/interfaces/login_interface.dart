import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';
import '../entities/login_entity.dart';

abstract class LoginInterface {
  Future<Either<Failure, LoginEntity>> login({
    @required String email,
    @required String password,
    @required String deviceName,
  });
}
