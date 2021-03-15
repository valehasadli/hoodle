import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/errors/failures.dart';
import '../../entities/translation_entity.dart';

abstract class AddHistoryInterface {
  Future<Either<Failure, TranslationEntity>> addHistory({@required int id});
}
