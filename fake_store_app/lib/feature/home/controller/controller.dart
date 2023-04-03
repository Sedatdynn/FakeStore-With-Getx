import 'package:get/get.dart';

import '../service/i_home_service.dart';

class AppController extends GetxController {
  RxBool isLoading = false.obs;
  IHomeService? homeService;
  List<dynamic> productModel = [];

  // AppController() {
  //   homeService = Get.find<IHomeService>();

  //   fetchAllProduct();
  // }
  @override
  void onInit() {
    super.onInit();
    homeService = Get.find<IHomeService>();
    fetchAllProduct();
  }

  Future<void> fetchAllProduct() async {
    showLoading();
    productModel = (await homeService!.fetchProductItems()) ?? [];
    hideLoading();
  }

  void showLoading() => isLoading.toggle();
  void hideLoading() => isLoading.toggle();
}
