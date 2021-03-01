import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('to string', () {
    expect(RoutePathException('message').toString(), 'ERROR: message');
  });
}
