import '../errors/route_path_exception.dart';

extension RoutePathExtension on String {
  /// Examples:
  ///
  /// `/feature/page` valid
  ///
  /// `/feature/page/` invalid

  bool get isAValidRoutePath {
    final regex = RegExp(r'^(\/[^\/ ]*)+');
    final lastCharacter = this[length - 1];

    return (lastCharacter != '/' || length == 1) && regex.hasMatch(this);
  }

  List<String> get extractedRoutePaths {
    if (!isAValidRoutePath) {
      throw RoutePathException('$this IS NOT A TYPE OF ROUTE PATH');
    }

    final routePathNames = split('/')..removeAt(0);
    return routePathNames.map((value) => '/$value').toList();
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
