import 'package:fake_store_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/binding/controller_binding.dart';
import 'feature/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppControllerBindings(),
      theme: const ITheme().appTheme,
      home: const HomeView(),
    );
  }
}
