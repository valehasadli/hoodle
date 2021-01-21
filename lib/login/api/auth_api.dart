import 'package:dartz/dartz.dart';
import 'package:hoodle/injections.dart';

import '../../common/errors/failures.dart';
import '../application/auth_facade_service.dart';

// this API made for other domain communicate with LOGIN domain
class AuthApi {
  final AuthFacadeService _service = serviceLocator<AuthFacadeService>();

  Future<Either<Failure, void>> logout() async {
    return await _service.logout();
  }
}
