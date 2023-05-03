import 'package:fake_store_app/core/init/base/view/base_view.dart';
import 'package:fake_store_app/feature/settings/viewModel/settings_view_model.dart';
import 'package:flutter/material.dart';

import '../../../packages_shelf.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = SettingsController();
    return BaseView<SettingsController>(
      viewModel: SettingsController(),
      onInitState: (model) {
        model.setContext(context);
        model.init();
      },
      safeArea: true,
      onPageBuilder: (context, value) {
        return Scaffold(
            body: Column(
          children: _columnBody(settingsController),
        ));
      },
    );
  }

  List<Widget> _columnBody(SettingsController settingsController) {
    return <Widget>[
      ListTile(
        onTap: () {
          settingsController.changeTheme();
        },
        trailing: const Icon(Icons.mode_night_outlined),
        title: const Text("Change Theme"),
        subtitle: const Text("THEMEEEEE"),
      ),
      const ListTile(
        trailing: Icon(Icons.language),
        title: Text("Change Language"),
        subtitle: Text("LANGUAGEEEE"),
      )
    ];
  }
}
