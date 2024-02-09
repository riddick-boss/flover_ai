import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/infrastructure/camera/camera_data_manager.dart';
import '../../../domain/infrastructure/permissions/permissions_manager.dart';

part 'camera_permission_state.dart';

class CameraPermissionCubit extends Cubit<CameraPermissionState> {
  CameraPermissionCubit(this._permissionsManager, this._cameraDataManager)
      : super(CameraPermissionDenied()) {
    _onStarted();
  }

  final PermissionsManager _permissionsManager;
  final CameraDataManager _cameraDataManager;

  StreamSubscription<bool>? _cameraPermissionGrantedStream;

  List<CameraDescription> getCameras() {
    return _cameraDataManager.cameras;
  }

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
