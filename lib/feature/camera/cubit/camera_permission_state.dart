part of 'camera_permission_cubit.dart';

sealed class CameraPermissionState {}

final class CameraPermissionGranted extends CameraPermissionState {}

final class CameraPermissionDenied extends CameraPermissionState {}
