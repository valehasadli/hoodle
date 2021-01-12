import 'dart:io';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';

import '../../domain/entities/login_entity.dart';
import '../../../common/platform/connectivity.dart';
import '../../domain/interfaces/login_interface.dart';
import '../data_sources/login_remote_data_provider.dart';
import '../data_sources/login_local_data_provider.dart';

class LoginRepository implements LoginInterface {
  final Connectivity connectivity;
  final LoginRemoteDataProvider loginRemoteDataProvider;
  final LoginLocalDataProvider loginLocalDataProvider;

  const LoginRepository({
    @required this.connectivity,
    @required this.loginRemoteDataProvider,
    @required this.loginLocalDataProvider,
  });

  @override
  Future<Either<Failure, LoginEntity>> login({
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    if (await connectivity.isConnected) {
      try {
        final LoginEntity login = await loginRemoteDataProvider.login(
          email: email,
          password: password,
          deviceName: deviceName,
        );

        await loginLocalDataProvider.cacheLogin(login: login);

        return Right(login);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }
}
