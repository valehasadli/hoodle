import 'dart:io';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';

import '../../domain/entities/login_entity.dart';
import '../../../common/platforms/internet.dart';
import '../../domain/interfaces/login_interface.dart';
import '../../domain/interfaces/logout_interface.dart';
import '../../domain/interfaces/token_interface.dart';
import '../data_sources/auth_remote_data_provider.dart';
import '../data_sources/auth_local_data_provider.dart';
import '../models/login_model.dart';

class AuthRepository
    implements LoginInterface, LogoutInterface, TokenInterface {
  final Internet internet;
  final AuthRemoteDataProvider authRemoteDataProvider;
  final AuthLocalDataProvider authLocalDataProvider;

  const AuthRepository({
    @required this.internet,
    @required this.authRemoteDataProvider,
    @required this.authLocalDataProvider,
  });

  @override
  Future<Either<Failure, LoginEntity>> login({
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    if (await internet.isConnected) {
      try {
        final LoginModel model = await authRemoteDataProvider.login(
          email: email,
          password: password,
          deviceName: deviceName,
        );

        final LoginEntity login = LoginEntity(
          id: model.id,
          name: model.name,
          email: model.email,
          emailVerifiedAt: model.emailVerifiedAt,
          rememberToken: model.rememberToken,
          isAdmin: model.isAdmin,
          createdAt: model.createdAt,
          updatedAt: model.updatedAt,
          token: model.token,
        );

        await authLocalDataProvider.cacheLogin(login: login);

        return Right(login);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await internet.isConnected) {
      try {
        final bool logout = await authRemoteDataProvider.logout();
        if (logout) await authLocalDataProvider.cacheLogout();

        return Right(logout);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }

  @override
  Future<Either<Failure, bool>> tokenStatus() async {
    if (await internet.isConnected) {
      try {
        final bool status = await authRemoteDataProvider.tokenStatus();

        return Right(status);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }
}
