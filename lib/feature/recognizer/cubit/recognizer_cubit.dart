import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognizer_state.dart';
part 'recognizer_cubit.freezed.dart';

class RecognizerCubit extends Cubit<RecognizerState> {
  RecognizerCubit()
      : super(const RecognizerState(
          recognizedFlowerName: null,
        ));

  bool _isDetecting = false;

  void onNextImage(CameraImage image) {
    if (!_isDetecting) {
      _isDetecting = true;
      log('detecting...');
      final startTime = DateTime.now().millisecondsSinceEpoch;

      _performDetection(image).then((value) {
        final endTime = DateTime.now().millisecondsSinceEpoch;
        final detectionTime = endTime - startTime;
        log('detectionTime is: $detectionTime');
        _isDetecting = false;
      });
    }
  }

  Future<void> _performDetection(CameraImage image) async {
    await Future.delayed(const Duration(seconds: 5), () {
      emit(state.copyWith(
          recognizedFlowerName: '${DateTime.now().millisecondsSinceEpoch}'));
    });
  }
}
