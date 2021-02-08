import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart' show kBaseUrl;
import '../models/registration_model.dart';

class RegistrationRemoteDataProvider {
  Future<RegistrationModel> registration({
    @required String name,
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    final String url = '$kBaseUrl/mobile/auth/registration';

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'device_name': deviceName,
      }),
    );

    if (response.statusCode == 201) {
      return RegistrationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
