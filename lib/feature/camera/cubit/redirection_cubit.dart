import 'package:flutter_bloc/flutter_bloc.dart';

part 'redirection_state.dart';

class RedirectionCubit extends Cubit<RedirectionState> {
  RedirectionCubit() : super(RedirectionInitial());
}
