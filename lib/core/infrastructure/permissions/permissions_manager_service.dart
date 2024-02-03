import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/permissions/permissions_manager.dart';

@Injectable(as: PermissionsManager)
class PermissionsManagerService implements PermissionsManager {
  @override
  // TODO: implement hasCameraPermission
  Stream<bool> get hasCameraPermission => Stream.value(false);
}
