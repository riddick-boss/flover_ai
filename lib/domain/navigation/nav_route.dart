enum NavRoute {
  splash(path: '/splash'),
  introAllowCamera(path: '/introAllowCamera'),
  camera(path: '/camera'),
  grantCameraPermission(path: '/grantCameraPermission');

  const NavRoute({required this.path});

  final String path;
}
