import 'package:dartz/dartz.dart';
import 'package:hoodle/injections.dart';

import '../../common/errors/failures.dart';
import '../application/auth_facade_service.dart';

class AuthApi {
  final AuthFacadeService _service = serviceLocator<AuthFacadeService>();

  Future<Either<Failure, bool>> logout() async {
    return await _service.logout();
  }
}
