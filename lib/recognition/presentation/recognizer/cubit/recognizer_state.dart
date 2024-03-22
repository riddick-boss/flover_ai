part of 'recognizer_cubit.dart';

@freezed
class RecognizerState with _$RecognizerState {
  const factory RecognizerState({
    required String? recognizedFlowerName,
  }) = _RecognizerState;
}
