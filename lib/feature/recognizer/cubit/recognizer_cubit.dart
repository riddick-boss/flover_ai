import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognizer_state.dart';
part 'recognizer_cubit.freezed.dart';

class RecognizerCubit extends Cubit<RecognizerState> {
  RecognizerCubit()
      : super(const RecognizerState(
          recognizedFlowerName: null,
        )) {
    Future.delayed(const Duration(seconds: 10), () {
      emit(state.copyWith(recognizedFlowerName: 'Tulip'));
    });
    Future.delayed(const Duration(seconds: 20), () {
      emit(state.copyWith(recognizedFlowerName: null));
    });
    Future.delayed(const Duration(seconds: 30), () {
      emit(state.copyWith(recognizedFlowerName: 'Rose'));
    });
  }
}
