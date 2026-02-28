import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(
      'onTransition: ${bloc.runtimeType} ${transition.currentState} => ${transition.nextState}',
    );
  }

  // @override
  // void onError(Bloc bloc, Object error, StackTrace stackTrace) {
  //   super.onError(bloc, error, stackTrace);
  //   print('onError: ${bloc.runtimeType} $error');
  // }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent: ${bloc.runtimeType} $event');
  }
}
