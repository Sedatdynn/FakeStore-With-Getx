import 'package:fake_store_app/feature/home/controller/controller.dart';
import 'package:fake_store_app/feature/home/service/home_service.dart';
import 'package:fake_store_app/feature/home/service/i_home_service.dart';
import 'package:fake_store_app/product/service/network_manager.dart';
import 'package:get/get.dart';

class AppControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeService>(
        () => HomeService(ProjectNetworkManager.instance.service, "products"));
    Get.put<AppController>(AppController());
  }
}
