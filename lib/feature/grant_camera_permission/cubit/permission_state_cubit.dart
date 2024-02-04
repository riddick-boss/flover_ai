import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/infrastructure/permissions/app_permission.dart';
import '../../../domain/infrastructure/permissions/permissions_manager.dart';

part 'permission_state_state.dart';

class PermissionStateCubit extends Cubit<PermissionStateState> {
  PermissionStateCubit(this._permissionsManager)
      : super(PermissionStateInitial()) {
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
        _permissionsManager.hasCameraPermission.skip(1).listen((isGranted) {
      final state =
          isGranted ? CameraPermissionGranted() : CameraPermissionDenied();
      emit(state);
    });
  }

  Future<void> onAllowCameraPermissionClicked() async {
    await _permissionsManager.requestPermission(AppPermission.camera);
  }
}
