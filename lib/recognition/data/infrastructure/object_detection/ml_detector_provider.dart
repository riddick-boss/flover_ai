import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class MlDetectorProvider {
  ObjectDetector? _streamObjectDetector;

  Future<ObjectDetector> getStreamObjetcDetector() async {
    final detector = _streamObjectDetector;

    if (detector != null) {
      return detector;
    }

    return _instantiateAndGetStreamObjectDetector();
  }

  Future<ObjectDetector> _instantiateAndGetStreamObjectDetector() async {
    final modelPath =
        await _getModelPath('assets/ml/model_with_metadata.tflite');
    final options = LocalObjectDetectorOptions(
      mode: DetectionMode.stream,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    final detector = ObjectDetector(options: options);
    _streamObjectDetector = detector;
    return detector;
  }

  Future<String> _getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!file.existsSync()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
