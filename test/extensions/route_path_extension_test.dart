import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final initialPath = "/";
  final featurePath = "/home";
  final path = "/home/notice";
  final subfeaturePath = "/home/notice/details";
  final wrongPath = "/home/notice/";
  final invalidPath = "home";
  final withoutBarPath = "home/details";

  group("Test the validation of a path", () {
    test("Should be vailid when is '/'", () {
      expect(initialPath.isAValidRoutePath, equals(true));
    });

    test("Should be vailid when is '/home'", () {
      expect(featurePath.isAValidRoutePath, equals(true));
    });

    test("Should be vailid when is '/home/notice'", () {
      expect(path.isAValidRoutePath, equals(true));
    });

    test("Should be vailid when is '/home/notice/details'", () {
      expect(subfeaturePath.isAValidRoutePath, equals(true));
    });

    test("Should be invailid when ends with '/'", () {
      expect(wrongPath.isAValidRoutePath, equals(false));
    });

    test("Should be invailid when dont have '/'", () {
      expect(invalidPath.isAValidRoutePath, equals(false));
    });

    test("Should be invailid when dont start with '/'", () {
      expect(withoutBarPath.isAValidRoutePath, equals(false));
    });
  });

  group("extracted route paths", () {
    test("should return the correct paths when is a valid path", () {
      expect(path.extractedRoutePaths, ["/home", "/notice"]);
    });

    test("should throw an exception when is not a valid path", () {
      expect(
        () => wrongPath.extractedRoutePaths,
        throwsA(isA<RoutePathException>()),
      );
    });
  });

  test("should return the correct feature path", () {
    expect(path.featureRoutePath, "/home");
  });

  test("Should return the correct subfeature route", () {
    expect(subfeaturePath.subfeatureRoutePath, "/notice");
  });

  group("Page route path", () {
    test("Should return the correct page route", () {
      expect(subfeaturePath.pageRoutePath, "/details");
    });

    test("Should return '/' wjen is the subfeature/feature initial page", () {
      expect(path.pageRoutePath, "/");
    });

    test("Should return '/' wjen is the subfeature/feature initial page", () {
      expect(featurePath.pageRoutePath, "/");
    });
  });

  group("path is a feature", () {
    test("Should return true when is a feature", () {
      expect(featurePath.pathIsAFeature, equals(true));
    });

    test("Should return false when is'nt a feature", () {
      expect(path.pathIsAFeature, equals(false));
    });
  });
}
