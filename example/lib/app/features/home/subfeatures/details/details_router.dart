import 'package:anthor_navigator/anthor_navigator.dart';
import 'details_page.dart';

class DetailsRouter extends AnthorSubfeatureRouter {
  @override
  List<AnthorRoute> get routes => [
        AnthorRoute(
          name: AnthorNavigator.initialRoute,
          child: (context, args) => DetailsPage(args),
        ),
      ];
}
