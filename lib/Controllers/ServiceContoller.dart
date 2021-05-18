import 'package:get/get.dart';
import 'package:qms/Model/ServiceModel.dart';
import 'package:qms/Repo/ServiceRepo.dart';
import 'package:qms/pages/LoginPage.dart';
import 'package:qms/pages/ServiceDeteils.dart';

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
      Get.to(() => ServiceDeteils());
      
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }

  }

  void cancelReservation(int serviceID) async {
    var rs = await sRrepo.cancelReservation(serviceID);
    if (rs[0] == 1) {
      print(rs[1]);

      update();
      getServiceDetails(serviceID);
      Get.off(() => ServiceDeteils());
      update();
      
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }

  }

  void bookInService(int serviceID) async {
    var rs = await sRrepo.bookInService(serviceID);
    if (rs[0] == 1) {
      print(rs[1]);

      update();
      getServiceDetails(serviceID);
      Get.off(() => ServiceDeteils());
      update();
      
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }

  }

  void userInCenter(int serviceID) async {
    var rs = await sRrepo.userInCenter(serviceID);
    if (rs[0] == 1) {
      print(rs[1]);

      update();
      getServiceDetails(serviceID);
      Get.off(() => ServiceDeteils());
      update();
      
    }
    else if (rs[0] == 1){
       Get.to(() => LoginPage());
    }

  }
}

