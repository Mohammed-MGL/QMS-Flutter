import 'package:get/get.dart';
import 'package:qms/pages/LoginPage.dart';

import '../Model/ServiceCenterDetailsModel.dart';
import '../Repo/ServiceCenterDetailsRepo.dart';

class ServiceCenterDetailsController extends GetxController {
  ServiceCenterDetailsModel scdInfo = ServiceCenterDetailsModel();
  ServiceCenterDetailsRepo scdrepo = ServiceCenterDetailsRepo();

  void getSCDInfo(int iD) async {
    var rs = await scdrepo.fetch_service_center(iD);
    if (rs[0] == 1) {
      scdInfo = rs[1];

      update();
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }
  }
}
