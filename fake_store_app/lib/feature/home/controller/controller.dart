import 'package:flutter/material.dart';

import '../../../packages_shelf.dart';
import '../../../product/utility/loading.dart';
import '../home_shelf.dart';

class AppController extends LoadingStateful {
  TextEditingController searchController = TextEditingController();
  IHomeService? homeService;
  List<dynamic> productModel = <dynamic>[].obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    homeService = Get.find<IHomeService>();
    fetchAllProduct();
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
}
