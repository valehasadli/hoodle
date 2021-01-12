import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/registration_entity.dart';

class RegistrationLocalDataProvider {
  Future<void> cacheRegistration({
    @required RegistrationEntity registration,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user_id', json.encode(registration.id));
    prefs.setString('name', json.encode(registration.name));
    prefs.setString('email', json.encode(registration.email));
    prefs.setString('token', json.encode(registration.token));
    prefs.setString('is_admin', json.encode(registration.isAdmin));
  }
}
