import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../common/errors/failures.dart';
import '../domain/entities/login_entity.dart';
import '../infrastructure/repositories/auth_repository.dart';

class AuthFacadeService {
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

  Future<Either<Failure, void>> logout() async {
    return await repository.logout();
  }
}
