import 'package:flutter/material.dart';
import '../anthor_navigator.dart';
import '../interfaces/subfeature_router_interface.dart';

/// That is defined in feature/subfeature's router file
class AnthorRoute {
  final String? name;
  final Widget? Function(BuildContext context, dynamic args)? child;
  //this is a file with routes of a subfeature
  final AnthorSubfeatureRouter? subfeature;

  AnthorRoute({
    required this.name,
    this.child,
    this.subfeature,
  }) : assert(
          (child == null || subfeature == null) &&
              (child != null || subfeature != null),
          throw AnthorNavigatorException(
            "$name is an invalid Route, the route most to be a child or a subfeature",
          ),
        );
}
