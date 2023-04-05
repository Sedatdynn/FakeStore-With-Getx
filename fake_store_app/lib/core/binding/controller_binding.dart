import '../../feature/home/home_shelf.dart';
import '../../packages_shelf.dart';
import '../../product/service/network_manager.dart';

class AppControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeService>(
        () => HomeService(ProjectNetworkManager.instance.service));
    Get.put<AppController>(AppController());
  }
}
