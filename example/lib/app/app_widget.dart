import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AnthorNavigator.initialRoute,
      onGenerateRoute: AnthorNavigator().generateRoute(appRouter: AppRouter()),
    );
  }
}
