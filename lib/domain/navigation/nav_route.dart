enum NavRoute {
  camera(path: '/camera');

  const NavRoute({
    required this.path
  });

  final String path;
}
