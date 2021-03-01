import 'package:anthor_navigator/anthor_navigator.dart';
import 'splash_page.dart';

class SplashRouter extends AnthorFeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (context, args) => SplashPage(),
        ),
      ];
}
