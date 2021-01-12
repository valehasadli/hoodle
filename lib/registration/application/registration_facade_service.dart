import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../domain/entities/registration_entity.dart';
import '../infrastructure/repositories/registration_repository.dart';

class RegistrationFacadeService {
  final RegistrationRepository repository;

  const RegistrationFacadeService({@required this.repository});

  Future<Either<Failure, RegistrationEntity>> registration({
    @required String name,
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    return await repository.registration(
      name: name,
      email: email,
      password: password,
      deviceName: deviceName,
    );
  }
}
