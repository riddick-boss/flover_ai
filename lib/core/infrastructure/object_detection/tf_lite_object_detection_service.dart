import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:injectable/injectable.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';
import '../../../domain/infrastructure/object_detection/recognition.dart';
import '../../util/log/logger.dart';
import 'tf_lite_image_processor.dart';

@Injectable(as: ObjectDetectionService)
class TFLiteObjectDetectionService implements ObjectDetectionService {
  TFLiteObjectDetectionService(this._imageProcessor) {
    logd('Initializing TFLiteObjectDetectionService');
    _loadModel();
    _loadLabels();
  }

  static const String _modelPath = 'assets/tf_lite_models/ssd_mobilenet.tflite';
  static const String _labelsPath = 'assets/tf_lite_models/ssd_mobilenet.txt';
  static const int modelInputWidth = 300;
  static const int modelInputHeight = 300;

  final TFLiteImageProcessor _imageProcessor;

  IsolateInterpreter? _isolateInterpreter;
  List<String>? _labels;

  @override
  Future<List<Recognition>> detectObject(CameraImage cameraImage) async {
    final recognitions = await _runDetection(cameraImage);
    return recognitions;
  }

  Future<List<Recognition>> _runDetection(CameraImage cameraImage) async {
    final preProcessedImage = await _preProcessImage(cameraImage);
    if (preProcessedImage == null) {
      return [];
    }
    final recognitions = _analyzeImage(preProcessedImage);
    return recognitions;
  }

  Future<void> _loadModel() async {
    logd('Loading model...');
    final options = InterpreterOptions();
    if (Platform.isAndroid) {
      options.addDelegate(XNNPackDelegate());
    }

    if (Platform.isIOS) {
      options.addDelegate(GpuDelegate());
    }

    final interpreter =
        await Interpreter.fromAsset(_modelPath, options: options);

    _isolateInterpreter =
        await IsolateInterpreter.create(address: interpreter.address);
    logd('Loading model completed');
  }

  Future<void> _loadLabels() async {
    logd('Loading labels...');
    final labelsText = await rootBundle.loadString(_labelsPath);
    _labels = labelsText.split('\n');
    logd('Loading labels completed');
  }

  Future<Image?> _preProcessImage(CameraImage cameraImage) async {
    final Image? image =
        await _imageProcessor.convertCameraImageToImage(cameraImage);
    if (image == null) {
      return null;
    }

    _imageProcessor.handleImageRotation(image);
    _imageProcessor.resizeImageForModel(image);
    return image;
  }

  Future<List<Recognition>> _analyzeImage(Image image) async {
    final imageMatrix = _prepareImageMatrix(image);
    final output = await _runInterpreter(imageMatrix);

    final classesRaw = output.elementAt(1).first as List<num>;
    final classes = classesRaw.map((value) => value.toInt()).toList();

    final scores = output.elementAt(2).first as List<num>;

    final numOfDetectionsRaw = output.last.first as num;
    final numOfDetections = numOfDetectionsRaw.toInt();

    final classifications = List.generate(numOfDetections, (index) {
      return _labels?[classes[index]];
    }).whereNotNull().toList();

    final recognitions = classifications.mapIndexed((index, classification) {
      final score = scores[index];
      return Recognition(
          id: index, label: classification, score: score.toDouble());
    }).toList();

    return recognitions;
  }

  List<List<List<num>>> _prepareImageMatrix(Image image) {
    return List.generate(
      image.height,
      (y) => List.generate(
        image.width,
        (x) {
          final pixel = image.getPixel(x, y);
          return [pixel.r, pixel.g, pixel.b];
        },
      ),
    );
  }

  Future<List<List<Object>>> _runInterpreter(
      List<List<List<num>>> imageMatrix) async {
    //input tensor
    final input = [imageMatrix];

    //output tensor
    final output = {
      0: List.generate(
          1, (_) => List.generate(10, (_) => List.filled(4, 0.0))), // locations
      1: List.generate(1, (_) => List.filled(10, 0)), // classes
      2: List.generate(1, (_) => List.filled(10, 0.0)), // scores
      3: [0.0], // number of detections
    };

    await _isolateInterpreter?.run(input, output);
    return output.values.toList();
  }
}
