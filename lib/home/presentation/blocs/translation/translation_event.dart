part of 'translation_bloc.dart';

class TranslationEvent extends Equatable {
  const TranslationEvent();

  @override
  List<Object> get props => [];
}

class TranslationKeyLanguageChanged extends TranslationEvent {
  final String language;

  const TranslationKeyLanguageChanged({@required this.language});

  @override
  List<Object> get props => [language];
}

class TranslationValueLanguageChanged extends TranslationEvent {
  final String language;

  const TranslationValueLanguageChanged({@required this.language});

  @override
  List<Object> get props => [language];
}

class TranslationSwitchLanguage extends TranslationEvent {
  final String keyLanguageLocale;
  final String valueLanguageLocale;

  const TranslationSwitchLanguage({
    @required this.keyLanguageLocale,
    @required this.valueLanguageLocale,
  });

  @override
  List<Object> get props => [keyLanguageLocale, valueLanguageLocale];
}

class TranslationKeyChanged extends TranslationEvent {
  final String key;

  const TranslationKeyChanged({@required this.key});

  @override
  List<Object> get props => [key];
}

class TranslationResetted extends TranslationEvent {
  const TranslationResetted();
}

class TranslationSubmitted extends TranslationEvent {
  const TranslationSubmitted();
}

class TranslationAddHistory extends TranslationEvent {
  const TranslationAddHistory();
}
