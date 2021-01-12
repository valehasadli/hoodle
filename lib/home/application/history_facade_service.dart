import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../domain/entities/history_entity.dart';
import '../infrastructure/repositories/history_repository.dart';

class HistoryFacadeService {
  final HistoryRepository repository;

  const HistoryFacadeService({@required this.repository});

  Future<Either<Failure, List<HistoryEntity>>> fetchHistory() async {
    return await repository.fetchHistory();
  }
}
