import 'package:test/test.dart';
import 'package:flover_ai/domain/assets/graphics.dart';

void main() {
  group(
    'graphics_test',
    () {
      test('all contain base path', () async {
        final graphicPaths = Graphics.values.map((e) => e.path);
        final allContainBasePath = graphicPaths
            .every((element) => element.contains(Graphics.defaultPath));
        expect(allContainBasePath, true);
      });
      test('all paths are unique', () async {
        final graphicPaths = Graphics.values.map((e) => e.path);
        final hasDuplicates =
            graphicPaths.length != graphicPaths.toSet().length;
        expect(hasDuplicates, false);
      });
    },
  );
}
