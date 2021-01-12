import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';
import '../entities/registration_entity.dart';

abstract class RegistrationInterface {
  Future<Either<Failure, RegistrationEntity>> registration({
    @required String name,
    @required String email,
    @required String password,
    @required String deviceName,
  });
}
