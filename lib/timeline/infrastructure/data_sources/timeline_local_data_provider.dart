import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/timeline_model.dart';

class TimelineLocalDataProvider {
  Future<List<TimelineModel>> fetchTimeline() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return (json.decode(prefs.getString('timeline')) as List)
        .map((timeline) => TimelineModel.fromJson(timeline))
        .toList();
  }

  Future<void> cacheTimeline({@required List<TimelineModel> model}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('history', json.encode(model));
  }
}
