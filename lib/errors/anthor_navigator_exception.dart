class AnthorNavigatorException implements Exception {
  final String message;
  AnthorNavigatorException(this.message);

  @override
  String toString() {
    return "ERROR: $message";
  }
}
