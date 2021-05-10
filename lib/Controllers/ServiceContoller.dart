import 'package:get/get.dart';
import 'package:qms/Model/ServiceModel.dart';
import 'package:qms/Repo/ServiceRepo.dart';
import 'package:qms/pages/LoginPage.dart';

import '../Model/ServiceCenterDetailsModel.dart';
import '../Repo/ServiceCenterDetailsRepo.dart';

class ServiceController extends GetxController {
  ServiceModel sInfo = ServiceModel();
  ServiceRepo sRrepo = ServiceRepo();

  void getServiceDetails(int serviceID) async {
    var rs = await sRrepo.getServiceDetails(serviceID);
    if (rs[0] == 1) {
      sInfo = rs[1];

      update();
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }

  }
}
