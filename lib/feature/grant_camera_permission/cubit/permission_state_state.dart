part of 'permission_state_cubit.dart';

sealed class PermissionStateState {}

final class PermissionStateInitial extends PermissionStateState {}

final class CameraPermissionGranted extends PermissionStateState {}

final class CameraPermissionDenied extends PermissionStateState {}
