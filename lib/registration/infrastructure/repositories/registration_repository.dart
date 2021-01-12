import 'dart:io';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';

import '../../domain/entities/registration_entity.dart';
import '../../../common/platform/connectivity.dart';
import '../../domain/interfaces/registration_interface.dart';
import '../data_sources/registration_local_data_provider.dart';
import '../data_sources/registration_remote_data_provider.dart';

class RegistrationRepository implements RegistrationInterface {
  final Connectivity connectivity;
  final RegistrationRemoteDataProvider registrationRemoteDataProvider;
  final RegistrationLocalDataProvider registrationLocalDataProvider;

  const RegistrationRepository({
    @required this.connectivity,
    @required this.registrationRemoteDataProvider,
    @required this.registrationLocalDataProvider,
  });

  @override
  Future<Either<Failure, RegistrationEntity>> registration({
    @required String name,
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    if (await connectivity.isConnected) {
      try {
        final RegistrationEntity registration =
            await registrationRemoteDataProvider.registration(
          name: name,
          email: email,
          password: password,
          deviceName: deviceName,
        );

        await registrationLocalDataProvider.cacheRegistration(
          registration: registration,
        );

        return Right(registration);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }
}
