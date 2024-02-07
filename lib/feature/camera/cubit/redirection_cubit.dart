import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/infrastructure/permissions/permissions_manager.dart';

part 'redirection_state.dart';

class RedirectionCubit extends Cubit<RedirectionState> {
  RedirectionCubit(this._permissionsManager) : super(RedirectionInitial()) {
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
      if (!isGranted) {
        Future.delayed(const Duration(seconds: 1), () {
          emit(RedirectToCameraPermissionScreen());
        });
      }
    });
  }
}
