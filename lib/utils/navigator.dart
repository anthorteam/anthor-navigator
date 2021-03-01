import 'package:flutter/material.dart';

import '../errors/route_path_exception.dart';
import '../extensions/route_path_extension.dart';
import '../interfaces/app_router_interface.dart';
import '../interfaces/feature_router_interface.dart';
import '../models/route_model.dart';
import '../pages/route_error_page.dart';

class AnthorNavigator {
  static const String initialRoute = "/";

  RouteFactory generateRoute({@required AnthorAppRouter appRouter}) {
    return (settings) {
      try {
        //get the selected feature route
        final feature = appRouter.features.firstWhere(
          (feature) => feature?.name == settings.name.featureRoutePath,
          orElse: () => null,
        );

        var route = _directToRouteWithSeledtedPage(
          featureRouter: feature?.router,
          routePath: settings.name,
        );

        if (route == null) {
          return _buildRouteError("ROUTE NOT FOUND: --- ${settings.name}");
        }

        return _buildRoute(
          route: route,
          settings: settings,
        );
      } on RoutePathException catch (e) {
        return _buildRouteError(e.message);
      }
    };
  }

  AnthorRoute _directToRouteWithSeledtedPage({
    AnthorFeatureRouter featureRouter,
    String routePath,
  }) {
    if (routePath.pathIsAFeature) {
      //then we have to return the initial page
      return featureRouter?.routes?.firstWhere(
        (element) => element.name == initialRoute,
        orElse: () => null,
      );
    }

    /// if is not a feauture, then is a subfeature or a page
    final route = featureRouter?.routes?.firstWhere(
      (element) => element.name == routePath.subfeatureRoutePath,
      orElse: () => null,
    );

    //the route have subfeature or a child
    if (route?.subfeature != null) {
      //then we have to return a page from a subfeature
      return route.subfeature.routes.firstWhere(
        (element) => element.name == routePath.pageRoutePath,
        orElse: () => null,
      );
    }

    //then return a page from a feature
    return route;
  }

  Route<dynamic> _buildRoute({
    @required AnthorRoute route,
    @required RouteSettings settings,
  }) {
    debugPrint("INIT ROUTE: --- ${settings.name}");

    return MaterialPageRoute(
      builder: (context) {
        return route?.child(context, settings?.arguments);
      },
      settings: settings,
    );
  }

  Route<dynamic> _buildRouteError(String message) {
    debugPrint("$message");
    return MaterialPageRoute(
      builder: (_) => RouteErrorPage(message: message),
    );
  }
}
