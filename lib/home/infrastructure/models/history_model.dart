import 'package:meta/meta.dart';

class HistoryModel {
  HistoryModel({
    @required this.id,
    @required this.userId,
    @required this.key,
    @required this.keyLanguageId,
    @required this.keyLanguageLocale,
    @required this.value,
    @required this.valueLanguageId,
    @required this.valueLanguageLocale,
    @required this.count,
    @required this.favorite,
    @required this.history,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int id;
  final int userId;
  final String key;
  final int keyLanguageId;
  final String keyLanguageLocale;
  final String value;
  final int valueLanguageId;
  final String valueLanguageLocale;
  final int count;
  final bool favorite;
  final bool history;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        userId: json["user_id"],
        key: json["key"],
        keyLanguageId: json["key_language_id"],
        keyLanguageLocale: json["key_language_locale"],
        value: json["value"],
        valueLanguageId: json["value_language_id"],
        valueLanguageLocale: json["value_language_locale"],
        count: json["count"],
        favorite: json["favorite"],
        history: json["history"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "key": key,
        "key_language_id": keyLanguageId,
        "key_language_locale": keyLanguageLocale,
        "value": value,
        "value_language_id": valueLanguageId,
        "value_language_locale": valueLanguageLocale,
        "count": count,
        "favorite": favorite,
        "history": history,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
