import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../notifier/theme_notifier.dart';

class AppProvider {
  static AppProvider? _instance;
  static AppProvider get instance {
    _instance ??= AppProvider._init();
    return _instance!;
  }

  AppProvider._init();
  List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ];
}
