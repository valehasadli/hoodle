import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';
import '../../domain/entities/history_entity.dart';
import '../../../common/platforms/internet.dart';
import '../../domain/interfaces/history_interface.dart';
import '../data_sources/history_remote_data_provider.dart';
import '../data_sources/history_local_data_provider.dart';
import '../models/history_model.dart';
import '../../../common/models/meta_model.dart';

class HistoryRepository implements HistoryInterface {
  final Internet internet;
  final HistoryRemoteDataProvider historyRemoteDataProvider;
  final HistoryLocalDataProvider historyLocalDataProvider;

  HistoryRepository({
    @required this.internet,
    @required this.historyRemoteDataProvider,
    @required this.historyLocalDataProvider,
  });

  @override
  Future<Either<Failure, List<HistoryEntity>>> fetchHistory({
    @required int page,
  }) async {
    if (await internet.isConnected) {
      try {
        final Map data = await historyRemoteDataProvider.fetchHistory(
          page: page,
        );

        final MetaModel metaModel = data['meta'];
        final List<HistoryModel> historyModel = data['history'];

        final List<HistoryEntity> history = historyModel
            .map(
              (history) => HistoryEntity(
                id: history.id,
                userId: history.userId,
                key: history.key,
                keyLanguageId: history.keyLanguageId,
                keyLanguageLocale: history.keyLanguageLocale,
                value: history.value,
                valueLanguageId: history.valueLanguageId,
                valueLanguageLocale: history.valueLanguageLocale,
                count: history.count,
                favorite: history.favorite,
                history: history.history,
                createdAt: history.createdAt,
                updatedAt: history.updatedAt,
                currentPage: metaModel.currentPage,
                lastPage: metaModel.lastPage,
                total: metaModel.total,
              ),
            )
            .toList();

        await historyLocalDataProvider.cacheHistory(model: historyModel);
        return Right(history);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<HistoryModel> model =
            await historyLocalDataProvider.fetchHistory();

        final List<HistoryEntity> history = model
            .map(
              (history) => HistoryEntity(
                id: history.id,
                userId: history.userId,
                key: history.key,
                keyLanguageId: history.keyLanguageId,
                keyLanguageLocale: history.keyLanguageLocale,
                value: history.value,
                valueLanguageId: history.valueLanguageId,
                valueLanguageLocale: history.valueLanguageLocale,
                count: history.count,
                favorite: history.favorite,
                history: history.history,
                createdAt: history.createdAt,
                updatedAt: history.updatedAt,
                currentPage: 1,
                lastPage: 1,
                total: model.length,
              ),
            )
            .toList();
        return Right(history);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
