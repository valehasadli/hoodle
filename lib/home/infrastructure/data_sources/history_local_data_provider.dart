import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/history_entity.dart';
import '../../infrastructure/models/history_model.dart';

class HistoryLocalDataProvider {
  Future<List<HistoryEntity>> fetchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<HistoryModel> model =
        (json.decode(prefs.getString('history')) as List)
            .map((history) => HistoryModel.fromJson(history))
            .toList();

    return model
        .map(
          (history) => HistoryEntity(
            id: history.id,
            userId: history.userId,
            key: history.key,
            keyLanguageId: history.keyLanguageId,
            keyLanguageLocale: history.keyLanguageLocale,
            value: history.value,
            valueLanguageId: history.valueLanguageId,
            valueLanguageLocale: history.valueLanguageLocale,
            count: history.count,
            favorite: history.favorite,
            history: history.history,
            createdAt: history.createdAt,
            updatedAt: history.updatedAt,
            currentPage: 1,
            lastPage: 1,
            total: model.length,
          ),
        )
        .toList();
  }

  Future<void> cacheHistory({@required List<HistoryEntity> history}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<HistoryModel> model = history
        .map(
          (data) => HistoryModel(
            id: data.id,
            userId: data.userId,
            key: data.key,
            keyLanguageId: data.keyLanguageId,
            keyLanguageLocale: data.keyLanguageLocale,
            value: data.value,
            valueLanguageId: data.valueLanguageId,
            valueLanguageLocale: data.valueLanguageLocale,
            count: data.count,
            favorite: data.favorite,
            history: data.history,
            createdAt: data.createdAt,
            updatedAt: data.updatedAt,
          ),
        )
        .toList();

    prefs.setString('history', json.encode(model));
  }
}
