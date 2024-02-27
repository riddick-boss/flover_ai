import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/log/logger.dart';
import '../../../domain/infrastructure/object_detection/object_detection_service.dart';
import '../../../domain/infrastructure/object_detection/recognition.dart';

part 'recognizer_state.dart';
part 'recognizer_cubit.freezed.dart';

class RecognizerCubit extends Cubit<RecognizerState> {
  RecognizerCubit(this._objectDetectionManager)
      : super(const RecognizerState(
          recognizedFlowerName: null,
        ));

  static const double _scoreThreshold = 0.7;

  final ObjectDetectionService _objectDetectionManager;

  bool _isDetecting = false;

  void onNextImage(CameraImage image) {
    if (!_isDetecting) {
      _isDetecting = true;
      log('detecting...');
      final startTime = DateTime.now().millisecondsSinceEpoch;

      _performDetection(image).then((recognition) {
        final endTime = DateTime.now().millisecondsSinceEpoch;
        log('detectionTime is: ${endTime - startTime}');
        final recognizedLabel = recognition?.label;
        if (recognizedLabel != null) {
          emit(state.copyWith(recognizedFlowerName: recognizedLabel));
        }
        _isDetecting = false;
      });
    }
  }

  Future<Recognition?> _performDetection(CameraImage image) async {
    final recognitions = await _objectDetectionManager.detectObject(image);
    logd('Recognitions: $recognitions');
    final bestRecognition = getMostRelevantRecognition(recognitions);
    logd('Best recognition: $bestRecognition');
    return bestRecognition;
  }

  Recognition? getMostRelevantRecognition(List<Recognition> recognitions) {
    return recognitions
        .where((element) => element.score > _scoreThreshold)
        .firstOrNull;
  }
}
