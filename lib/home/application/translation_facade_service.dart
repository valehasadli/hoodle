import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../domain/entities/translation_entity.dart';
import '../infrastructure/repositories/translation_repository.dart';

class TranslationFacadeService {
  final TranslationRepository repository;

  const TranslationFacadeService({@required this.repository});

  Future<Either<Failure, TranslationEntity>> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  }) async {
    return await repository.translate(
      key: key,
      keyLanguageLocale: keyLanguageLocale,
      valueLanguageLocale: valueLanguageLocale,
    );
  }
}
