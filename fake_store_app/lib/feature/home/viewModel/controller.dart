import 'package:flutter/material.dart';

import '../../../core/init/base/viewModel/base_view_model.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../packages_shelf.dart';
import '../../../product/utility/loading.dart';
import '../home_shelf.dart';
import 'package:provider/provider.dart';

// LoadingStateful with
class AppController extends LoadingStateful with BaseViewModel {
  TextEditingController searchController = TextEditingController();
  IHomeService? homeService;
  List<dynamic> productModel = <dynamic>[].obs;
  var searchQuery = "".obs;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    homeService = Get.find<IHomeService>();
    fetchAllProduct();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> fetchAllProduct() async {
    try {
      changeLoading;
      productModel = (await homeService!.fetchProductItems()) ?? [];
      changeLoading;
    } catch (e) {
      rethrow;
    }
  }

  List<dynamic> get filteredProducts {
    if (searchQuery.value.isEmpty) {
      return productModel;
    } else {
      return productModel
          .where((product) => product.title
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void changeTheme(BuildContext context) {
    print("Change");
    context.read<ThemeNotifier>().changeTheme();
    update();
  }
}
