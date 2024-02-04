import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/infrastructure/permissions/app_permission.dart';
import '../../../domain/infrastructure/permissions/permissions_manager.dart';
import '../../../domain/util/unit.dart';

@Injectable(as: PermissionsManager)
class PermissionsManagerService implements PermissionsManager {
  final _onPermissionStatsChanged = PublishSubject<Unit>();

  @override
  Stream<bool> get hasCameraPermission => _onPermissionStatsChanged
      .startWith(Unit())
      .flatMap((_) => Permission.camera.status
          .asStream()
          .map((status) => status.isGranted));

  @override
  Future<void> requestPermission(AppPermission appPermission) async {
    final permission = _mapToPermission(appPermission);
    await permission.request();
    _onPermissionStatsChanged.add(Unit());
  }

  Permission _mapToPermission(AppPermission appPermission) {
    switch (appPermission) {
      case AppPermission.camera:
        return Permission.camera;
    }
  }
}
