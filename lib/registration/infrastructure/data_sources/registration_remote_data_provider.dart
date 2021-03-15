import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart';
import '../models/registration_model.dart';

class RegistrationRemoteDataProvider {
  Future<RegistrationModel> registration({
    @required String name,
    @required String email,
    @required String password,
    @required String deviceName,
  }) async {
    final String url = '$kBaseUrl/api/mobile/auth/registration';

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: kGuestRequestHeaders(),
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
