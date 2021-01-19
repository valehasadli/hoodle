import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HistoryEntity extends Equatable {
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
  final int currentPage;
  final int lastPage;
  final int total;

  const HistoryEntity({
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
    @required this.currentPage,
    @required this.lastPage,
    @required this.total,
  });

  @override
  List<Object> get props => [
        id,
        userId,
        key,
        keyLanguageId,
        keyLanguageLocale,
        value,
        valueLanguageId,
        valueLanguageLocale,
        count,
        favorite,
        history,
        createdAt,
        updatedAt,
        currentPage,
        lastPage,
        total,
      ];
}
