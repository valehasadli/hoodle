import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart';
import '../models/login_model.dart';

class AuthRemoteDataProvider {
  Future<LoginModel> login({
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    final String url = '$kBaseUrl/api/mobile/auth/login';

    final http.Response response = await http.post(
      url,
      headers: kGuestRequestHeaders(),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'device_name': deviceName,
      }),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<bool> logout() async {
    final String url = '$kBaseUrl/api/mobile/auth/logout';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final http.Response response = await http.post(
      url,
      headers: kAuthRequestHeaders(rawToken: prefs.getString('token')),
    );

    return response.statusCode == 204;
  }

  Future<bool> tokenStatus() async {
    final String url = '$kBaseUrl/api/mobile/auth/token_status';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final http.Response response = await http.post(
      url,
      headers: kAuthRequestHeaders(rawToken: prefs.getString('token')),
    );

    return response.statusCode == 204;
  }
}
