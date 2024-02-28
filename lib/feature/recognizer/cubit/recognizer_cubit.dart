import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

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
    final inputImage = InputImage.fromBytes(
        bytes: image.planes.first.bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation:
              InputImageRotationValue.fromRawValue(0)!, // used only in Android
          format: InputImageFormatValue.fromRawValue(
              image.format.raw)!, // used only in iOS
          bytesPerRow: image.planes.first.bytesPerRow,
        )); // used only in iOS

    final options = ObjectDetectorOptions(
      classifyObjects: true,
      mode: DetectionMode.stream,
      multipleObjects: true,
    );
    final objectDetector = ObjectDetector(options: options);
    final detectedObjects = await objectDetector.processImage(inputImage);
    final label = detectedObjects.firstOrNull?.labels.firstOrNull;
    if (label == null) {
      emit(state.copyWith(recognizedFlowerName: null));
      return;
    }
    final recogniezd = '${label.text} ${label.confidence}';
    emit(state.copyWith(recognizedFlowerName: recogniezd));
  }
}
