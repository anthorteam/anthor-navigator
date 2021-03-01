import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFeature extends AnthorFeatureRouter {
  @override
  List<AnthorRoute> get routes => throw UnimplementedError();
}

void main() {
  test(
    "should return the correct data",
    () {
      final name = "/test";
      final data = AnthorFeature(
        router: MockFeature(),
        name: name,
      );
      expect(data.name, name);
    },
  );
}
