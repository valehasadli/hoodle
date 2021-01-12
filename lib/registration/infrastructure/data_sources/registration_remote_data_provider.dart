import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../../domain/entities/registration_entity.dart';
import '../models/registration_model.dart';

class RegistrationRemoteDataProvider {
  Future<RegistrationEntity> registration({
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
      RegistrationModel model = RegistrationModel.fromJson(
        json.decode(response.body),
      );
      return RegistrationEntity(
        id: model.id,
        name: model.name,
        email: model.email,
        emailVerifiedAt: model.emailVerifiedAt,
        rememberToken: model.rememberToken,
        isAdmin: model.isAdmin,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        token: model.token,
      );
    } else {
      throw ServerException();
    }
  }
}
