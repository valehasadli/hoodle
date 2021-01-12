import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/platform/connectivity.dart';
import '../../domain/entities/translation_entity.dart';
import '../../domain/interfaces/translation_interface.dart';
import '../data_sources/translation_remote_data_provider.dart';
import '../data_sources/translation_local_data_provider.dart';

class TranslationRepository implements TranslationInterface {
  final Connectivity connectivity;
  final TranslationRemoteDataProvider translationRemoteDataProvider;
  final TranslationLocalDataProvider translationLocalDataProvider;

  TranslationRepository({
    @required this.connectivity,
    @required this.translationRemoteDataProvider,
    @required this.translationLocalDataProvider,
  });

  @override
  Future<Either<Failure, TranslationEntity>> translate({
    @required String key,
    @required String keyLanguageLocale,
    @required String valueLanguageLocale,
  }) async {
    if (await connectivity.isConnected) {
      try {
        final TranslationEntity translation =
            await translationRemoteDataProvider.translate(
          key: key,
          keyLanguageLocale: keyLanguageLocale,
          valueLanguageLocale: valueLanguageLocale,
        );
        await translationLocalDataProvider.cacheTranslation(
          translation: translation,
        );

        return Right(translation);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final TranslationEntity translation =
            await translationLocalDataProvider.getTranslation();
        return Right(translation);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
