import 'package:get/get.dart';

import 'Controllers/QRController.dart';
import 'Controllers/ServiceCentersController.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => QRController() , fenix: true);
    Get.put<QRController>(QRController(), permanent: true);
    Get.put<ServiceCentersController>(ServiceCentersController(), permanent: true);

  }
}
