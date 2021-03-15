import 'dart:io';

import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/platforms/internet.dart';
import '../../domain/entities/translation_entity.dart';
import '../../domain/interfaces/translation/translate_interface.dart';
import '../../domain/interfaces/translation/add_history_interface.dart';
import '../data_sources/translation_remote_data_provider.dart';
import '../data_sources/translation_local_data_provider.dart';
import '../models/translation_model.dart';

class TranslationRepository implements TranslateInterface, AddHistoryInterface {
  final Internet internet;
  final TranslationRemoteDataProvider translationRemoteDataProvider;
  final TranslationLocalDataProvider translationLocalDataProvider;

  TranslationRepository({
    @required this.internet,
    @required this.translationRemoteDataProvider,
    @required this.translationLocalDataProvider,
  });

  @override
  Future<Either<Failure, TranslationEntity>> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  }) async {
    if (await internet.isConnected) {
      try {
        final TranslationModel model =
            await translationRemoteDataProvider.translate(
          key: key,
          keyLanguageLocale: keyLanguageLocale,
          valueLanguageLocale: valueLanguageLocale,
        );

        final TranslationEntity translation = _entity(model: model);

        await translationLocalDataProvider.cacheTranslation(model: model);

        return Right(translation);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final TranslationModel model =
            await translationLocalDataProvider.getTranslation();

        final TranslationEntity translation = _entity(model: model);
        return Right(translation);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, TranslationEntity>> addHistory({
    @required int id,
  }) async {
    if (await internet.isConnected) {
      try {
        final TranslationModel model =
            await translationRemoteDataProvider.addHistory(id: id);

        final TranslationEntity translation = _entity(model: model);

        return Right(translation);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }

  TranslationEntity _entity({@required TranslationModel model}) {
    return TranslationEntity(
      id: model.id,
      userId: model.userId,
      key: model.key,
      keyLanguageId: model.keyLanguageId,
      keyLanguageLocale: model.keyLanguageLocale,
      value: model.value,
      valueLanguageId: model.valueLanguageId,
      valueLanguageLocale: model.valueLanguageLocale,
      count: model.count,
      favorite: model.favorite,
      history: model.history,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
