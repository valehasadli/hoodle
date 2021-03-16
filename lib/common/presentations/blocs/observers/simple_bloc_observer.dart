import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(Bloc bloc) {
    print('${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(Bloc bloc) {
    print('${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType}, error: $error, stackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print('${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }
}
