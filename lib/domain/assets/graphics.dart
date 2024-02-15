enum Graphics {
  splashBackground(path: '${Graphics.defaultPath}splash_background.jpg'),
  introAllowCameraImage(
      path: '${Graphics.defaultPath}intro_allow_camera_image.svg'),
  introDetailedExplanationImage(
      path: '${Graphics.defaultPath}intro_detailed_explanation_image.svg');

  const Graphics({required this.path});

  final String path;

  static const String defaultPath = 'assets/graphics/';
}
