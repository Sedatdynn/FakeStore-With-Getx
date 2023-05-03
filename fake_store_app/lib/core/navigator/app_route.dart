import 'package:auto_route/auto_route.dart';
import 'package:fake_store_app/product/enums/route/routes_enum.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: HomeDetailRoute.page, path: RouteEnum.detail.withSlash),
    AutoRoute(page: SettingsRoute.page, path: RouteEnum.settings.withSlash),
  ];
}
