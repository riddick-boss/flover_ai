enum NavRoute {
  splash(path: '/splash'),
  camera(path: '/camera'),
  grantCameraPermission(path: '/grantCameraPermission');

  const NavRoute({required this.path});

  final String path;
}
