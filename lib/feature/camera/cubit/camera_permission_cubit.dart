import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/infrastructure/permissions/permissions_manager.dart';

part 'camera_permission_state.dart';

class CameraPermissionCubit extends Cubit<CameraPermissionState> {
  CameraPermissionCubit(this._permissionsManager)
      : super(CameraPermissionDenied()) {
    _onStarted();
  }

  final PermissionsManager _permissionsManager;

  StreamSubscription<bool>? _cameraPermissionGrantedStream;

  @override
  Future<void> close() {
    _cameraPermissionGrantedStream?.cancel();
    return super.close();
  }

  void _onStarted() {
    _cameraPermissionGrantedStream =
        _permissionsManager.hasCameraPermission.listen((isGranted) {
      final state =
          isGranted ? CameraPermissionGranted() : CameraPermissionDenied();
      emit(state);
    });
  }
}
