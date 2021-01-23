import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/models/translation_model.dart';

class TranslationLocalDataProvider {
  Future<TranslationModel> getTranslation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final parsed = json
        .decode(preferences.getString('translation'))
        .cast<String, dynamic>();

    return TranslationModel.fromJson(parsed);
  }

  Future<void> cacheTranslation({@required TranslationModel model}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('translation', json.encode(model));
  }
}
