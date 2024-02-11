enum Graphics {
  splashBackground(path: '${Graphics.defaultPath}splash_background.jpg');

  const Graphics({required this.path});

  final String path;

  static const String defaultPath = 'assets/graphics/';
}
