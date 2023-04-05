import 'package:flutter/material.dart';

import 'core/binding/controller_binding.dart';
import 'core/navigator/app_route.dart';
import 'core/theme/theme.dart';
import 'packages_shelf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(_appRouter),
      theme: const ITheme().appTheme,
      initialBinding: AppControllerBindings(),
    );
  }
}
