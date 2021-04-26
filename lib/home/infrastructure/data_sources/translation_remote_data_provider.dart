import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart';
import '../models/translation_model.dart';

class TranslationRemoteDataProvider {
  Future<TranslationModel> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  }) async {
    final String url = '$kBaseUrl/api/mobile/translations';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: kAuthRequestHeaders(rawToken: prefs.getString('token')),
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

  Future<TranslationModel> addHistory({@required int id}) async {
    final String url = '$kBaseUrl/api/mobile/user/translation/history/$id';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final http.Response response = await http.put(
      Uri.parse(url),
      headers: kAuthRequestHeaders(rawToken: prefs.getString('token')),
      body: jsonEncode(<String, int>{
        'history': 1,
      }),
    );

    if (response.statusCode == 200) {
      return TranslationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
