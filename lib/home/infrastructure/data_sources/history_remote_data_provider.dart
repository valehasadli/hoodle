import 'dart:io';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/errors/exceptions.dart';
import '../../../common/helpers/double_quote.dart';
import '../../../common/utils/constants.dart' show kBaseUrl;
import '../models/history_model.dart';
import '../../../common/models/meta_model.dart';

class HistoryRemoteDataProvider {
  Future<Map> fetchHistory({@required int page}) async {
    final String url = '$kBaseUrl/mobile/user/translation/history?page=$page';

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

      final List<HistoryModel> history = (data['data'] as List)
          .map((history) => HistoryModel.fromJson(history))
          .toList();

      final MetaModel meta = MetaModel.fromJson(data['meta']);

      return {'history': history, 'meta': meta};
    } else {
      throw ServerException();
    }
  }
}
