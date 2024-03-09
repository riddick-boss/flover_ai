import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';

part 'recognizer_state.dart';
part 'recognizer_cubit.freezed.dart';

class RecognizerCubit extends Cubit<RecognizerState> {
  RecognizerCubit(this._objectDetectionService)
      : super(const RecognizerState(
          recognizedFlowerName: null,
        ));

  final ObjectDetectionService _objectDetectionService;

  bool _isDetecting = false;

  void onNextImage(CameraImage image, DeviceOrientation? deviceOrientation,
      int sensorOrientation, CameraLensDirection cameraLensDirection) {
    if (!_isDetecting) {
      _isDetecting = true;
      log('detecting...');
      final startTime = DateTime.now().millisecondsSinceEpoch;

      _objectDetectionService
          .detectObject(
        image,
        deviceOrientation,
        sensorOrientation,
        cameraLensDirection,
      )
          .then((detectedFlower) {
        final endTime = DateTime.now().millisecondsSinceEpoch;
        final detectionTime = endTime - startTime;
        log('detectionTime is: $detectionTime');
        emit(state.copyWith(recognizedFlowerName: detectedFlower));
        _isDetecting = false;
      });
    }
  }
}
