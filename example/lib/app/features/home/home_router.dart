import 'package:anthor_navigator/anthor_navigator.dart';
import 'subfeatures/details/details_router.dart';
import 'home_page.dart';

class HomeRouter extends AnthorFeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (context, args) => HomePage(),
        ),
        AnthorRoute(
          name: "/details",
          subfeature: DetailsRouter(),
        ),
      ];
}
