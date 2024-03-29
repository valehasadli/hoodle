import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/login_entity.dart';

class AuthLocalDataProvider {
  Future<void> cacheLogin({@required LoginEntity login}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user_id', json.encode(login.id));
    prefs.setString('name', json.encode(login.name));
    prefs.setString('email', json.encode(login.email));
    prefs.setString('token', json.encode(login.token));
    prefs.setString('is_admin', json.encode(login.isAdmin));
  }

  Future<void> cacheLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('user_id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('token');
    prefs.remove('is_admin');
  }
}
