part of 'redirection_cubit.dart';

sealed class RedirectionState {}

final class RedirectionInitial extends RedirectionState {}

final class RedirectToCameraPermissionScreen extends RedirectionState {}

final class RedirectToFlowerDetailsScreen extends RedirectionState {}
