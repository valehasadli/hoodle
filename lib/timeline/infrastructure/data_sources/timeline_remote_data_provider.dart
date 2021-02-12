import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/utils/api_constants.dart';
import '../models/timeline_model.dart';

class TimelineRemoteDataProvider {
  Future<List<TimelineModel>> fetchTimeline() async {
    final String url = '$kBaseUrl/api/mobile/timeline';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final http.Response response = await http.get(
      url,
      headers: kAuthRequestHeaders(rawToken: prefs.getString('token')),
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
