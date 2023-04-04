// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:fake_store_app/feature/detail/home_detail.dart' as _i1;
import 'package:fake_store_app/feature/home/view/home_view.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeDetailView(
          key: args.key,
          detailList: args.detailList,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeDetailView]
class HomeDetailRoute extends _i3.PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    _i4.Key? key,
    required dynamic detailList,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            key: key,
            detailList: detailList,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const _i3.PageInfo<HomeDetailRouteArgs> page =
      _i3.PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.key,
    required this.detailList,
  });

  final _i4.Key? key;

  final dynamic detailList;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{key: $key, detailList: $detailList}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
