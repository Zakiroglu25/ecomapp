import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  final _logger = Logger('AppBlocObserver');

  @override
  void onCreate(BlocBase bloc) {
    _logger.info('${bloc.runtimeType} created.');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.info('${bloc.runtimeType} => $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe('${bloc.runtimeType} => ($error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.info('${bloc.runtimeType} => $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.info('${bloc.runtimeType} => $transition.');
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.info('${bloc.runtimeType} closed.');
    super.onClose(bloc);
  }
}
