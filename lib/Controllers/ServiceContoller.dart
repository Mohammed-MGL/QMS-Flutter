import 'dart:io';

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
  bool is_loding = true;
  bool is_conect = true;
  int serviceID ;

  void getServiceDetails(int serID) async {
    serviceID = serID;
    is_conect = true;
    var rs ;
    try {
       rs = await sRrepo.getServiceDetails(serID);
    } on SocketException {
      print("objectnet");
      is_conect = false;
      update();
      return;
    }

    if (rs[0] == 1) {
      sInfo = rs[1];
      is_loding = false;
      update();
      Get.to(() => ServiceDeteils());
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
    }
  }

  void refreshPage()async{
     var rs ;
     try {
       rs = await sRrepo.getServiceDetails(serviceID);
    } on SocketException {
      print("objectnet");
      is_conect = false;
      update();
      return;
    }

    if (rs[0] == 1) {
      sInfo = rs[1];
      is_loding = false;
      update();
      Get.to(() => ServiceDeteils());
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
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
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
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
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
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
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
    }
  }
}
