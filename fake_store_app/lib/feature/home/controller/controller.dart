import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/i_home_service.dart';

class AppController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
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
      showLoading();
      productModel = (await homeService!.fetchProductItems()) ?? [];
      hideLoading();
    } catch (e) {
      print("Error fetching products: $e");
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

  void showLoading() => isLoading.toggle();
  void hideLoading() => isLoading.toggle();
}
