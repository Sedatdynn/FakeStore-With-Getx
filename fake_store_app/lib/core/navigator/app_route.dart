import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/core/navigator/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: HomeDetailRoute.page, path: "/detail"),
  ];
}
