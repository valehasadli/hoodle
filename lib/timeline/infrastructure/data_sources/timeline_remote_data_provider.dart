import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart' show kBaseUrl;
import '../../../common/helpers/double_quote.dart';
import '../models/timeline_model.dart';

class TimelineRemoteDataProvider {
  Future<List<TimelineModel>> fetchTimeline() async {
    final String url = '$kBaseUrl/mobile/timeline';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = DoubleQuote.trim(prefs.getString('token'));

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((timeline) => TimelineModel.fromJson(timeline))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
