import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final featurePath = "/home";
  final path = "/home/notice";
  final subfeaturePath = "/home/notice/details";

  test("should return the correct paths when is a valid path", () {
    expect(path.extractedRoutePaths, ["/home", "/notice"]);
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
