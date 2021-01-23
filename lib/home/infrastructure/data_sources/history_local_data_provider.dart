import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/models/history_model.dart';

class HistoryLocalDataProvider {
  Future<List<HistoryModel>> fetchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return (json.decode(prefs.getString('history')) as List)
        .map((history) => HistoryModel.fromJson(history))
        .toList();
  }

  Future<void> cacheHistory({@required List<HistoryModel> model}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('history', json.encode(model));
  }
}
