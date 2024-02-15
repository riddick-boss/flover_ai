import 'package:flutter_bloc/flutter_bloc.dart';

part 'recognizer_state.dart';

class RecognizerCubit extends Cubit<RecognizerState> {
  RecognizerCubit() : super(RecognizerInitial());
}
