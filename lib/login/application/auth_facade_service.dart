import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../common/errors/failures.dart';
import '../domain/entities/login_entity.dart';
import '../domain/interfaces/login_interface.dart';
import '../domain/interfaces/logout_interface.dart';
import '../domain/interfaces/token_interface.dart';
import '../infrastructure/repositories/auth_repository.dart';

class AuthFacadeService implements LoginInterface, LogoutInterface, TokenInterface {
  final AuthRepository repository;

  const AuthFacadeService({@required this.repository});

  Future<Either<Failure, LoginEntity>> login({
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    return await repository.login(
      email: email,
      password: password,
      deviceName: deviceName,
    );
  }

  Future<Either<Failure, bool>> logout() async {
    return await repository.logout();
  }

  Future<Either<Failure, bool>> tokenStatus() async {
    return await repository.tokenStatus();
  }
}
