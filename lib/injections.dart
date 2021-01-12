import 'package:get_it/get_it.dart';

// common
import './common/platform/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

// login_form
import './login/infrastructure/data_sources/login_remote_data_provider.dart';
import './login/infrastructure/data_sources/login_local_data_provider.dart';
import './login/infrastructure/repositories/login_repository.dart';
import './login/application/login_facade_service.dart';
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
import './home/presentation/bloc/history/history_bloc.dart';

// home - translation
import './home/infrastructure/data_sources/translation_remote_data_provider.dart';
import './home/infrastructure/data_sources/translation_local_data_provider.dart';
import './home/infrastructure/repositories/translation_repository.dart';
import './home/application/translation_facade_service.dart';
import './home/presentation/bloc/translation/translation_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  commonDependencies();
  loginDependencies();
  registrationDependencies();
  homeHistoryDependencies();
  homeTranslationDependencies();
}

Future<void> commonDependencies() async {
  // Common - core
  serviceLocator.registerLazySingleton(
    () => Connectivity(serviceLocator()),
  );

  // 3rd part packages that needs to be register.
  serviceLocator.registerLazySingleton(
    () => DataConnectionChecker(),
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
    () => LoginFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer - repositories
  serviceLocator.registerLazySingleton(
    () => LoginRepository(
      connectivity: serviceLocator(),
      loginRemoteDataProvider: serviceLocator(),
      loginLocalDataProvider: serviceLocator(),
    ),
  );

  // Infrastructure Layer - data source
  serviceLocator.registerLazySingleton(
    () => LoginRemoteDataProvider(),
  );

  serviceLocator.registerLazySingleton(
    () => LoginLocalDataProvider(),
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
      connectivity: serviceLocator(),
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
      connectivity: serviceLocator(),
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
      connectivity: serviceLocator(),
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
