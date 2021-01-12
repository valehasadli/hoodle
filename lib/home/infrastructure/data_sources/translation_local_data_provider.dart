import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/models/translation_model.dart';
import '../../domain/entities/translation_entity.dart';

class TranslationLocalDataProvider {
  Future<TranslationEntity> getTranslation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final parsed = json
        .decode(
          preferences.getString('translation'),
        )
        .cast<String, dynamic>();

    final TranslationModel model = TranslationModel.fromJson(parsed);

    return TranslationEntity(
      id: model.id,
      userId: model.userId,
      key: model.key,
      keyLanguageId: model.keyLanguageId,
      keyLanguageLocale: model.keyLanguageLocale,
      value: model.value,
      valueLanguageId: model.valueLanguageId,
      valueLanguageLocale: model.valueLanguageLocale,
      count: model.count,
      favorite: model.favorite,
      history: model.history,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  Future<void> cacheTranslation({
    @required TranslationEntity translation,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final TranslationModel model = TranslationModel(
      id: translation.id,
      userId: translation.userId,
      key: translation.key,
      keyLanguageId: translation.keyLanguageId,
      keyLanguageLocale: translation.keyLanguageLocale,
      value: translation.value,
      valueLanguageId: translation.valueLanguageId,
      valueLanguageLocale: translation.valueLanguageLocale,
      count: translation.count,
      favorite: translation.favorite,
      history: translation.history,
      createdAt: translation.createdAt,
      updatedAt: translation.updatedAt,
    );
    preferences.setString('translation', json.encode(model));
  }
}
