import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSubFeature implements AnthorSubfeatureRouter {
  @override
  List<AnthorRoute> get routes => throw UnimplementedError();
}

void main() {
  String route;
  AnthorSubfeatureRouter mockSubFeature;
  Widget page;

  setUp(() {
    route = "/page";
    mockSubFeature = MockSubFeature();
    page = Container();
  });

  test(
    "should return the correct data",
    () {
      final data = AnthorRoute(name: route, child: (_, args) => page);
      expect(data.name, route);
    },
  );

  test(
    "should work when have a sub feature",
    () {
      final data = AnthorRoute(
        name: route,
        subfeature: mockSubFeature,
      );
      expect(data.subfeature, mockSubFeature);
    },
  );
}
