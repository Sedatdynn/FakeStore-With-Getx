import 'package:fake_store_app/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'core/init/provider/provider_list.dart';
import 'feature/settings/viewModel/settings_view_model.dart';
import 'package:flutter/material.dart';

import 'core/init/binding/controller_binding.dart';
import 'core/navigator/app_route.dart';
import 'packages_shelf.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: AppProvider.instance.providerList, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  final settingsController = SettingsController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(_appRouter),
      theme: context.watch<ThemeNotifier>().currentTheme,
      initialBinding: AppControllerBindings(),
    );
  }
}
