import '../interfaces/feature_router_interface.dart';

/// this is defined in `app_router.dart`
class AnthorFeature {
  final String name;
  //this is from a file with routes of a feature
  final AnthorFeatureRouter router;

  AnthorFeature({
    required this.name,
    required this.router,
  });
}
