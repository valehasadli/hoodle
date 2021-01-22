import 'dart:io';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/errors/exceptions.dart';
import '../../../common/helpers/double_quote.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../models/translation_model.dart';

class TranslationRemoteDataProvider {
  Future<TranslationModel> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  }) async {
    final String url = '$kBaseUrl/mobile/translations';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = DoubleQuote.trim(preferences.getString('token'));

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'key': key,
        'key_language_locale': keyLanguageLocale,
        'value_language_locale': valueLanguageLocale,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TranslationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
