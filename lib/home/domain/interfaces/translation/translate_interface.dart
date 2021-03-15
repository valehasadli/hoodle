import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/errors/failures.dart';
import '../../entities/translation_entity.dart';

abstract class TranslateInterface {
  Future<Either<Failure, TranslationEntity>> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  });
}
