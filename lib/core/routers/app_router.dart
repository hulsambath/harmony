import 'package:auto_route/auto_route.dart';
import 'package:harmony/core/routers/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Home.page, initial: true),
      ];
}
