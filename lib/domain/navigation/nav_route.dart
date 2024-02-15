enum NavRoute {
  splash(path: '/splash'),
  introAllowCamera(path: '/introAllowCamera'),
  introDetailedExplanation(path: '/introDetailedExplanation'),
  camera(path: '/camera'),
  grantCameraPermission(path: '/grantCameraPermission');

  const NavRoute({required this.path});

  final String path;
}
