import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_obj.freezed.dart';

@freezed
class DetectedObj with _$DetectedObj {
  const factory DetectedObj({
    required String text,
    required double confidence,
  }) = _DetectedObj;
}
