import 'package:fake_store_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/binding/controller_binding.dart';
import 'core/navigator/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: const ITheme().appTheme,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: AppControllerBindings(),
          home: child!,
        );
      },
    );
  }
}
