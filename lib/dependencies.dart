import 'package:get/get.dart';

import 'Controllers/AccountController.dart';
import 'Controllers/QRController.dart';
import 'Controllers/ServiceCenterDetailsController.dart';
import 'Controllers/ServiceCentersController.dart';
import 'Controllers/ServiceContoller.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => QRController() , fenix: true);
    Get.put<QRController>(QRController(), permanent: true);
    Get.put<ServiceCentersController>(ServiceCentersController(),
        permanent: true);
    Get.put<ServiceCenterDetailsController>(ServiceCenterDetailsController(),
        permanent: true);
    Get.put<AccountController>(AccountController(), permanent: true);
     Get.put<ServiceController>(ServiceController(), permanent: true);
  }
}
