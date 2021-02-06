import 'package:dartz/dartz.dart';

import '../../injections.dart';
import '../../common/errors/failures.dart';

import '../domain/interfaces/logout_interface.dart';
import '../application/auth_facade_service.dart';

class AuthApi implements LogoutInterface {
  final AuthFacadeService _service = serviceLocator<AuthFacadeService>();

  Future<Either<Failure, bool>> logout() async {
    return await _service.logout();
  }
}
