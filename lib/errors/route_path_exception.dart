class RoutePathException implements Exception {
  final String message;
  RoutePathException(this.message);

  @override
  String toString() {
    return "ERROR: $message";
  }
}
