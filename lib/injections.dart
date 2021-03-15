import 'package:get_it/get_it.dart';

// common
import './common/platforms/internet.dart';
import './common/presentations/blocs/auth/auth_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

// login
import './login/infrastructure/data_sources/auth_remote_data_provider.dart';
import './login/infrastructure/data_sources/auth_local_data_provider.dart';
import './login/infrastructure/repositories/auth_repository.dart';
import './login/application/auth_facade_service.dart';
import './login/presentation/bloc/login_bloc.dart';

// registration
import './registration/infrastructure/data_sources/registration_remote_data_provider.dart';
import './registration/infrastructure/data_sources/registration_local_data_provider.dart';
import './registration/infrastructure/repositories/registration_repository.dart';
import './registration/application/registration_facade_service.dart';
import './registration/presentation/bloc/registration_bloc.dart';

// home - history
import './home/infrastructure/data_sources/history_remote_data_provider.dart';
import './home/infrastructure/data_sources/history_local_data_provider.dart';
import './home/infrastructure/repositories/history_repository.dart';
import './home/application/history_facade_service.dart';
import './home/presentation/blocs/history/history_bloc.dart';

// home - translation
import './home/infrastructure/data_sources/translation_remote_data_provider.dart';
import './home/infrastructure/data_sources/translation_local_data_provider.dart';
import './home/infrastructure/repositories/translation_repository.dart';
import './home/application/translation_facade_service.dart';
import './home/presentation/blocs/translation/translation_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> ensureInitialized() async {
  commonDependencies();
  loginDependencies();
  registrationDependencies();
  homeHistoryDependencies();
  homeTranslationDependencies();
}

Future<void> commonDependencies() async {
  // Platform Layer
  serviceLocator.registerLazySingleton(
    () => Internet(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => DataConnectionChecker(),
  );

  // Presentation Layer
  serviceLocator.registerFactory(
    () => AuthBloc(),
  );
}

Future<void> loginDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => LoginBloc(
      service: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => AuthFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer - repositories
  serviceLocator.registerLazySingleton(
    () => AuthRepository(
      internet: serviceLocator(),
      authRemoteDataProvider: serviceLocator(),
      authLocalDataProvider: serviceLocator(),
    ),
  );

  // Infrastructure Layer - data source
  serviceLocator.registerLazySingleton(
    () => AuthRemoteDataProvider(),
  );

  serviceLocator.registerLazySingleton(
    () => AuthLocalDataProvider(),
  );
}

Future<void> registrationDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => RegistrationBloc(
      service: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => RegistrationFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer - repositories
  serviceLocator.registerLazySingleton(
    () => RegistrationRepository(
      internet: serviceLocator(),
      registrationRemoteDataProvider: serviceLocator(),
      registrationLocalDataProvider: serviceLocator(),
    ),
  );

  // Infrastructure Layer - data source
  serviceLocator.registerLazySingleton(
    () => RegistrationRemoteDataProvider(),
  );

  serviceLocator.registerLazySingleton(
    () => RegistrationLocalDataProvider(),
  );
}

Future<void> homeHistoryDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => HistoryBloc(
      service: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => HistoryFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer - repositories
  serviceLocator.registerLazySingleton(
    () => HistoryRepository(
      internet: serviceLocator(),
      historyRemoteDataProvider: serviceLocator(),
      historyLocalDataProvider: serviceLocator(),
    ),
  );

  // Infrastructure Layer - data source
  serviceLocator.registerLazySingleton(
    () => HistoryRemoteDataProvider(),
  );

  serviceLocator.registerLazySingleton(
    () => HistoryLocalDataProvider(),
  );
}

Future<void> homeTranslationDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => TranslationBloc(
      service: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => TranslationFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer - repositories
  serviceLocator.registerLazySingleton(
    () => TranslationRepository(
      internet: serviceLocator(),
      translationRemoteDataProvider: serviceLocator(),
      translationLocalDataProvider: serviceLocator(),
    ),
  );

  // Infrastructure Layer - data source
  serviceLocator.registerLazySingleton(
    () => TranslationRemoteDataProvider(),
  );

  serviceLocator.registerLazySingleton(
    () => TranslationLocalDataProvider(),
  );
}
