import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../../../common/helpers/double_quote.dart';
import '../models/login_model.dart';

class AuthRemoteDataProvider {
  Future<LoginModel> login({
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    final String url = '$kBaseUrl/mobile/auth/login';

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
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

  Future<void> logout() async {
    final String url = '$kBaseUrl/mobile/auth/logout';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = DoubleQuote.trim(prefs.getString('token'));

    final http.Response response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw ServerException();
    }
  }
}
