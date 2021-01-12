import 'dart:io';
import 'dart:convert';
// import 'package:hoodle_translation/home/infrastructure/models/link_model.dart';
// import 'package:hoodle_translation/home/infrastructure/models/meta_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/errors/exceptions.dart';
import '../../../common/helpers/double_quote.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../models/history_model.dart';
import '../../domain/entities/history_entity.dart';

class HistoryRemoteDataProvider {
  Future<List<HistoryEntity>> fetchHistory() async {
    final String url = '$kBaseUrl/mobile/user/translation/history?page=1';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = DoubleQuote.trim(prefs.getString('token'));

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<HistoryModel> model = (data['data'] as List)
          .map((history) => HistoryModel.fromJson(history))
          .toList();

      // final MetaModel meta = MetaModel.fromJson(data['meta']);
      // final LinkModel links = LinkModel.fromJson(data['links']);

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
            ),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
