import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _onStart();
  }

  Future<void> _onStart() async {
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      if (await Permission.camera.isGranted) {
        _goToRecognizer.add(null);
        return;
      }

      _goToIntro.add(null);
    });
  }

  final _goToRecognizer = StreamController<void>();
  Stream<void> get goToRecognizer => _goToRecognizer.stream;

  final _goToIntro = StreamController<void>();
  Stream<void> get goToIntro => _goToIntro.stream;

  @override
  Future<void> close() {
    _goToRecognizer.close();
    _goToIntro.close();
    return super.close();
  }
}
