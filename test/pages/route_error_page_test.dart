import 'package:anthor_navigator/pages/route_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final route = "/home";

  testWidgets(
    "load details page with the correct message",
    (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: RouteErrorPage(message: route)));
      expect(find.text(route), findsOneWidget);
    },
  );
}
