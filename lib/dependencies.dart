import 'package:get/get.dart';

import 'Controllers/QRController.dart';

class Dep extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => QRController() , fenix: true);
    Get.put<QRController>(QRController(), permanent: true);
  }
}
