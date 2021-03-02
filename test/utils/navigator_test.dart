import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  RouteFactory routes;

  setUp(() {
    routes = MockAppRouter().generator;
  });

  group("call routes by features", () {
    test("should work well when is called the correct route", () {
      final settings = RouteSettings(name: "/", arguments: "23");

      final route = routes?.call(settings);

      expect(route.settings.name, equals("/"));
      expect(route.settings.arguments, equals("23"));
    });

    test("should not work  when is called an incorrect route", () {
      final settings = RouteSettings(name: "/incorrect", arguments: "23");

      final route = routes?.call(settings);

      expect(route?.settings?.name, isNull);
      expect(route?.settings?.arguments, isNull);
    });
  });

  group("call routes by pages in features", () {
    test("should work well when is called a correct route from feature", () {
      final settings = RouteSettings(name: "/second/details");

      final route = routes?.call(settings);

      expect(route.settings.name, equals("/second/details"));
      expect(route.settings.arguments, isNull);
    });

    test("should not work when is called an incorrect route in feature", () {
      final settings = RouteSettings(
        name: "/second/test",
      );

      final route = routes?.call(settings);

      expect(route?.settings?.name, isNull);
      expect(route?.settings?.arguments, isNull);
    });

    test(
        "should not work when is called an incorrect route in a route in a feature",
        () {
      final settings = RouteSettings(
        name: "/second/test/details",
        arguments: "23",
      );

      final route = routes?.call(settings);

      expect(route?.settings?.name, isNull);
      expect(route?.settings?.arguments, isNull);
    });
  });

  group("call routes by subfeatures in features", () {
    test("should work well when is called a correct route from subfeature", () {
      final settings = RouteSettings(name: "/second/example");

      final route = routes?.call(settings);

      expect(route.settings.name, equals("/second/example"));
      expect(route.settings.arguments, isNull);
    });

    test("should not work when is called an incorrect subfeature route", () {
      final settings = RouteSettings(
        name: "/second/example/deta",
      );

      final route = routes?.call(settings);

      expect(route?.settings?.name, isNull);
      expect(route?.settings?.arguments, isNull);
    });

    test("should work when is called an correct route in a subfeature", () {
      final settings = RouteSettings(
        name: "/second/example/details",
        arguments: "23",
      );

      final route = routes?.call(settings);

      expect(route?.settings?.name, "/second/example/details");
      expect(route?.settings?.arguments, equals("23"));
    });
  });
}
