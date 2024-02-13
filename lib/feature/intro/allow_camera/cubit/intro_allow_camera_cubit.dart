import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'intro_allow_camera_state.dart';

class IntroAllowCameraCubit extends Cubit<IntroAllowCameraState> {
  IntroAllowCameraCubit() : super(IntroAllowCameraInitial());

  final _goToSettings = StreamController<bool>();

  Stream<bool> get goToSettings => _goToSettings.stream;

  @override
  Future<void> close() {
    _goToSettings.close();
    return super.close();
  }

  Future<void> onAllowCameraPermissionClicked() async {
    final isPermanentlyDenied = await Permission.camera.isPermanentlyDenied;
    if (isPermanentlyDenied) {
      _handleCameraPermanentlyDenied();
      return;
    }
    _askForCameraPermission();
  }

  void _handleCameraPermanentlyDenied() {
    _goToSettings.add(true);
  }

  Future<void> _askForCameraPermission() async {
    await Permission.camera.onGrantedCallback(() => null).request();
  }
}
