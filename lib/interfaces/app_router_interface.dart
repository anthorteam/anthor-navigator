import '../models/feature_model.dart';

//features routes
abstract class AnthorAppRouter {
  List<AnthorFeature> get features;
  Function get generator;
}
