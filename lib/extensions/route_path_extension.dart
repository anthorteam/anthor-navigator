import '../errors/anthor_navigator_exception.dart';

extension RoutePathExtension on String {
  /// Examples:
  ///
  /// `/feature/page` valid
  ///
  /// `/feature/page/` invalid

  List<String> get extractedRoutePaths {
    try {
      final route = Uri.tryParse(this);

      var paths = List.of(route?.pathSegments);

      if (paths.isEmpty) return ["/"];

      paths.removeWhere((element) => element.isEmpty);

      return paths.map((value) => '/$value').toList();
    } on FormatException {
      throw AnthorNavigatorException('$this IS NOT A TYPE OF ROUTE PATH');
    }
  }

  /// `/featureRoutePath`
  String get featureRoutePath => extractedRoutePaths.first;

  /// `/featureRoutePath/subfeatureRoutePath`
  String get subfeatureRoutePath {
    return extractedRoutePaths.length > 1 ? extractedRoutePaths[1] : '/';
  }

  /// `/featureRoutePath/subfeatureRoutePath/pageRoutePath` or `/featureRouterPath/pageRoutePath`
  String get pageRoutePath =>
      extractedRoutePaths.length > 2 ? extractedRoutePaths[2] : "/";

  bool get pathIsAFeature => extractedRoutePaths.length == 1;
}
