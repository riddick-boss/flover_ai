import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognition.freezed.dart';

@freezed
class Recognition with _$Recognition {
  const factory Recognition({
    required int id,
    required String label,
    required double score,
  }) = _Recognition;
}
