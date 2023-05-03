import 'package:fake_store_app/core/init/notifier/theme_notifier.dart';

import '../../../core/init/base/viewModel/base_view_model.dart';
import 'package:flutter/material.dart';

import '../../../product/utility/loading.dart';
import 'package:provider/provider.dart';

class SettingsController extends LoadingStateful with BaseViewModel {
  ThemeData? currentTheme;
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void changeTheme() {
    print("Change");
    context?.read<ThemeNotifier>().changeTheme();
  }
}
