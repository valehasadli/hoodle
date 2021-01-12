import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';
import '../../domain/entities/history_entity.dart';
import '../../../common/platform/connectivity.dart';
import '../../domain/interfaces/history_interface.dart';
import '../data_sources/history_remote_data_provider.dart';
import '../data_sources/history_local_data_provider.dart';

class HistoryRepository implements HistoryInterface {
  final Connectivity connectivity;
  final HistoryRemoteDataProvider historyRemoteDataProvider;
  final HistoryLocalDataProvider historyLocalDataProvider;

  HistoryRepository({
    @required this.connectivity,
    @required this.historyRemoteDataProvider,
    @required this.historyLocalDataProvider,
  });

  @override
  Future<Either<Failure, List<HistoryEntity>>> fetchHistory() async {
    if (await connectivity.isConnected) {
      try {
        final List<HistoryEntity> history =
            await historyRemoteDataProvider.fetchHistory();

        await historyLocalDataProvider.cacheHistory(history: history);
        return Right(history);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<HistoryEntity> history =
            await historyLocalDataProvider.fetchHistory();
        return Right(history);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
