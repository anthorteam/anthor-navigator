import 'package:anthor_navigator/anthor_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MockAppRouter extends AnthorAppRouter {
  @override
  List<AnthorFeature> get features => [
        AnthorFeature(
          name: AnthorNavigator.initialRoute,
          router: MockHomeRouter(),
        ),
        AnthorFeature(
          name: "/second",
          router: MockSecondRouter(),
        ),
      ];

  @override
  Function get generateRoute =>
      AnthorNavigator().generateRoute(appRouter: MockAppRouter());
}

class MockHomeRouter extends AnthorFeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (_, args) => Container(),
        ),
      ];
}

class MockSecondRouter extends AnthorFeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (_, args) => Container(),
        ),
        AnthorRoute(
          name: "/details",
          child: (_, args) => Container(),
        ),
        AnthorRoute(
          name: "/example",
          subfeature: MockExampleRouter(),
        ),
      ];
}

class MockExampleRouter extends AnthorSubfeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (_, args) => Container(),
        ),
        AnthorRoute(
          name: "/details",
          child: (_, args) => Container(),
        ),
      ];
}
