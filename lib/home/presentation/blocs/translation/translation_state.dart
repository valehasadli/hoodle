part of 'translation_bloc.dart';

class TranslationState extends Equatable {
  final int id;
  final int userId;
  final String key;
  final String keyLanguageLocale;
  final String value;
  final String valueLanguageLocale;
  final int count;
  final bool favorite;
  final bool history;
  final TranslationStatus status;
  final TranslationEvent event;

  const TranslationState({
    this.id = 0,
    this.userId = 0,
    this.key = '',
    this.keyLanguageLocale = 'en',
    this.value = '',
    this.valueLanguageLocale = 'az',
    this.count = 0,
    this.favorite = false,
    this.history = false,
    this.status = TranslationStatus.pure,
    this.event = const TranslationEvent(),
  });

  TranslationState copyWith({
    int id,
    int userId,
    String key,
    String keyLanguageLocale,
    String value,
    String valueLanguageLocale,
    int count,
    bool favorite,
    bool history,
    TranslationStatus status,
    TranslationEvent event,
  }) {
    return TranslationState(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      key: key ?? this.key,
      keyLanguageLocale: keyLanguageLocale ?? this.keyLanguageLocale,
      value: value ?? this.value,
      valueLanguageLocale: valueLanguageLocale ?? this.valueLanguageLocale,
      count: count ?? this.count,
      favorite: favorite ?? this.favorite,
      history: history ?? this.history,
      status: status ?? this.status,
      event: event ?? this.event,
    );
  }

  @override
  List<Object> get props => [
        id,
        userId,
        key,
        keyLanguageLocale,
        value,
        valueLanguageLocale,
        count,
        favorite,
        history,
        status,
        event,
      ];
}
