import 'package:anthor_navigator/anthor_navigator.dart';
import 'features/home/home_router.dart';
import 'features/splash/splash_router.dart';

class AppRouter extends AnthorAppRouter {
  @override
  List<AnthorFeature> get features => [
        AnthorFeature(
          name: AnthorNavigator.initialRoute,
          router: SplashRouter(),
        ),
        AnthorFeature(
          name: "/home",
          router: HomeRouter(),
        ),
      ];

  @override
  Function get generator =>
      AnthorNavigator().generateRoute(appRouter: AppRouter());
}
