import 'package:flover_ai/app/presentation/navigation/nav_route.dart';
import 'package:test/test.dart';

void main() {
  group(
    'nav_route_test',
    () {
      test('all routes are unique', () async {
        final navRoutePaths = NavRoute.values.map((e) => e.path);
        final hasDuplicates =
            navRoutePaths.length != navRoutePaths.toSet().length;
        expect(hasDuplicates, false);
      });
    },
  );
}
