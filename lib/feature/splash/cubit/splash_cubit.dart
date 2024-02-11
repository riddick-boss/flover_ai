import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _onStarted();
  }

  StreamSubscription<bool>? _redirectStream;

  @override
  Future<void> close() {
    _redirectStream?.cancel();
    return super.close();
  }

  void _onStarted() {
    _redirectStream = Stream.fromFuture(
      Future.delayed(
        const Duration(seconds: 1),
        () {
          return true;
        },
      ),
    ).listen((event) {
      emit(SplashRedirect());
    });
  }
}
