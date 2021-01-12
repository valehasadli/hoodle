import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../common/errors/failures.dart';
import '../domain/entities/login_entity.dart';
import '../infrastructure/repositories/login_repository.dart';

class LoginFacadeService {
  final LoginRepository repository;

  const LoginFacadeService({@required this.repository});

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
}
