import 'app_permission.dart';

abstract class PermissionsManager {
  Stream<bool> get hasCameraPermission;
  Future<void> requestPermission(AppPermission appPermission);
}
