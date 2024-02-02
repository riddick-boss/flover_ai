import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_permission_state.dart';

class CameraPermissionCubit extends Cubit<CameraPermissionState> {
  CameraPermissionCubit() : super(CameraPermissionDenied());
}
