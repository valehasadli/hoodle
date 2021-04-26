import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/errors/failures.dart';
import '../../entities/history_entity.dart';

abstract class HistoryInterface {
  Future<Either<Failure, List<HistoryEntity>>> fetchHistory({
    @required int page,
  });
}
