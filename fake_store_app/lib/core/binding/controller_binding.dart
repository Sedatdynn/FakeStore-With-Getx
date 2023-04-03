import '../../feature/home/controller/controller.dart';
import '../../feature/home/service/home_service.dart';
import '../../feature/home/service/i_home_service.dart';
import '../../product/service/network_manager.dart';
import 'package:get/get.dart';

class AppControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeService>(
        () => HomeService(ProjectNetworkManager.instance.service));
    Get.put<AppController>(AppController());
  }
}
