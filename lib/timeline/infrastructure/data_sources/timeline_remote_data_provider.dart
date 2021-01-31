import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../../../common/helpers/double_quote.dart';
import '../../../common/models/meta_model.dart';
import '../models/timeline_model.dart';

class TimelineRemoteDataProvider {
  Future<Map> fetchTimeline({@required int page}) async {
    final String url = '$kBaseUrl/mobile/timeline?page=$page';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = DoubleQuote.trim(preferences.getString('token'));

    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<TimelineModel> timeline = (data['data'] as List)
          .map((timeline) => TimelineModel.fromJson(timeline))
          .toList();

      final MetaModel meta = MetaModel.fromJson(data['meta']);

      return {'timeline': timeline, 'meta': meta};
    } else {
      throw ServerException();
    }
  }
}
