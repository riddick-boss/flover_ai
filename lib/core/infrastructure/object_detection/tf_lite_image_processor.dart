import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:injectable/injectable.dart';

import 'tf_lite_object_detection_service.dart';

@injectable
class TFLiteImageProcessor {
  void handleImageRotation(Image image) {
    if (Platform.isAndroid) {
      image = copyRotate(image, angle: 90);
    }
  }

  void resizeImageForModel(Image image) {
    image = copyResize(
      image,
      width: TFLiteObjectDetectionService.modelInputWidth,
      height: TFLiteObjectDetectionService.modelInputHeight,
    );
  }

  Future<Image?> convertCameraImageToImage(CameraImage cameraImage) async {
    Image image;

    if (cameraImage.format.group == ImageFormatGroup.yuv420) {
      image = convertYUV420ToImage(cameraImage);
    } else if (cameraImage.format.group == ImageFormatGroup.bgra8888) {
      image = convertBGRA8888ToImage(cameraImage);
    } else if (cameraImage.format.group == ImageFormatGroup.jpeg) {
      image = convertJPEGToImage(cameraImage);
    } else if (cameraImage.format.group == ImageFormatGroup.nv21) {
      image = convertNV21ToImage(cameraImage);
    } else {
      return null;
    }

    return image;
  }

  Image convertYUV420ToImage(CameraImage cameraImage) {
    final width = cameraImage.width;
    final height = cameraImage.height;

    final uvRowStride = cameraImage.planes[1].bytesPerRow;
    final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    final yPlane = cameraImage.planes[0].bytes;
    final uPlane = cameraImage.planes[1].bytes;
    final vPlane = cameraImage.planes[2].bytes;

    final image = Image(width: width, height: height);

    var uvIndex = 0;

    for (var y = 0; y < height; y++) {
      var pY = y * width;
      var pUV = uvIndex;

      for (var x = 0; x < width; x++) {
        final yValue = yPlane[pY];
        final uValue = uPlane[pUV];
        final vValue = vPlane[pUV];

        final r = yValue + 1.402 * (vValue - 128);
        final g =
            yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
        final b = yValue + 1.772 * (uValue - 128);

        image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);

        pY++;
        if (x.isOdd && uvPixelStride == 2) {
          pUV += uvPixelStride;
        } else if (x.isOdd && uvPixelStride == 1) {
          pUV++;
        }
      }

      if (y.isOdd) {
        uvIndex += uvRowStride;
      }
    }
    return image;
  }

  Image convertBGRA8888ToImage(CameraImage cameraImage) {
    final bytes = cameraImage.planes[0].bytes;

    final image = Image.fromBytes(
      width: cameraImage.width,
      height: cameraImage.height,
      bytes: bytes.buffer,
      order: ChannelOrder.rgba,
    );

    return image;
  }

  Image convertJPEGToImage(CameraImage cameraImage) {
    final bytes = cameraImage.planes[0].bytes;

    final image = decodeImage(bytes);

    return image!;
  }

  Image convertNV21ToImage(CameraImage cameraImage) {
    final yuvBytes = cameraImage.planes[0].bytes;
    final vuBytes = cameraImage.planes[1].bytes;

    final image = Image(
      width: cameraImage.width,
      height: cameraImage.height,
    );

    convertNV21ToRGB(
      yuvBytes,
      vuBytes,
      cameraImage.width,
      cameraImage.height,
      image,
    );

    return image;
  }

  void convertNV21ToRGB(Uint8List yuvBytes, Uint8List vuBytes, int width,
      int height, Image image) {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final yIndex = y * width + x;
        final uvIndex = (y ~/ 2) * (width ~/ 2) + (x ~/ 2);

        final yValue = yuvBytes[yIndex];
        final uValue = vuBytes[uvIndex * 2];
        final vValue = vuBytes[uvIndex * 2 + 1];

        final r = yValue + 1.402 * (vValue - 128);
        final g =
            yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128);
        final b = yValue + 1.772 * (uValue - 128);

        image.setPixelRgba(x, y, r.toInt(), g.toInt(), b.toInt(), 255);
      }
    }
  }
}
