import 'package:get/get.dart';
import 'package:qms/Model/ServiceCenterDetailsModel.dart';
import 'package:qms/Repo/ServiceCenterDetailsRepo.dart';
import 'package:qms/pages/LoginPage.dart';
import 'package:qms/pages/ServiceCenterDetailsPage.dart';

import 'ServiceCenterDetailsController.dart';

class QRController extends GetxController {
  ServiceCenterDetailsRepo scdrepo = ServiceCenterDetailsRepo();
  ServiceCenterDetailsModel scdInfo = ServiceCenterDetailsModel();

  bool val = false;
  var qrText = "";

  void printCode(String code) {
    // val = !val ;
    update();
    print("the code is : $code");
  }

  // void getSCDInfo(String scName) async {
    
  //         Get.find<ServiceCenterDetailsController>().getSCDInfo(int.parse(scName));

  //   // var rs = await scdrepo.(scName);
  //   // if (rs[0] == 1) {
  //   //   Get.find<ServiceCenterDetailsController>().updateSCInfo(rs[1]);
  //   //   Get.off(() => ServiceCenterDetailsPage());
  //   //   update();
  //   // } else if (rs[0] == 1) {
  //   //   Get.offAll(() => LoginPage());
  //   // }
  // }
}
