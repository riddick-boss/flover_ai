import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'intro_allow_camera_state.dart';

class IntroAllowCameraCubit extends Cubit<IntroAllowCameraState> {
  IntroAllowCameraCubit() : super(IntroAllowCameraInitial()) {
    _onStart();
  }

  Future<void> _onStart() async {
    if (await Permission.camera.isGranted) {
      _goToIntroDetailedExplanation.add(null);
    }
  }

  final _goToSettings = StreamController<void>();
  Stream<void> get goToSettings => _goToSettings.stream;

  final _goToIntroDetailedExplanation = StreamController<void>();
  Stream<void> get goToIntroDetailedExplanation =>
      _goToIntroDetailedExplanation.stream;

  @override
  Future<void> close() {
    _goToSettings.close();
    _goToIntroDetailedExplanation.close();
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
    _goToSettings.add(null);
  }

  Future<void> _askForCameraPermission() async {
    await Permission.camera
        .onGrantedCallback(() => _onCameraPermissionGranted())
        .request();
  }

  void _onCameraPermissionGranted() {
    _goToIntroDetailedExplanation.add(null);
  }
}
