import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qms/pages/LoginPage.dart';

import '../Model/ServiceCenterDetailsModel.dart';
import '../Repo/ServiceCenterDetailsRepo.dart';
import 'FavoriteController.dart';
import 'package:qms/Model/ServiceCentersModel.dart';

class ServiceCenterDetailsController extends GetxController {
  ServiceCenterDetailsModel scdInfo = ServiceCenterDetailsModel();
  ServiceCenterDetailsRepo scdrepo = ServiceCenterDetailsRepo();
  bool is_loding = true;
  int scID;
  bool is_NotF = false;
  bool Ent = true;

  void getSCDInfo(int iD) async {
    Ent= true;
    var rs;
    try {
      rs = await scdrepo.fetch_service_center(iD);
    } on SocketException {
      Ent = false;
      update();
      return;
    }
    scID = iD;
    if (rs[0] == 1) {
      scdInfo = rs[1];
      is_loding = false;
      is_NotF = false;

      update();
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
    } else if (rs[0] == 3) {
      is_NotF = true;
      Get.defaultDialog(
        title: "Service Center Not found",
        content: Text(
          "\(o_o)/",
          style: TextStyle(fontSize: 22),
        ),
        barrierDismissible: true,
      );
    }
  }

  void refreshPage() async {
    var rs = await scdrepo.fetch_service_center(scID);

    if (rs[0] == 1) {
      scdInfo = rs[1];
      is_loding = false;

      update();
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
    } else if (rs[0] == 3) {
      // TODO
      // Get.off(() => ());
    }
  }

  void updateSCInfo(ServiceCenterDetailsModel scInfo) {
    scdInfo = scInfo;
    is_loding = false;
    update();
  }

  void addToFav() {
    if (!is_NotF) {
      var dsc = scdInfo.serviceCenter;
      var sc = Results(
          icon: dsc.icon,
          id: dsc.id,
          image: dsc.image,
          isOnline: dsc.isOnline,
          location: dsc.location,
          name: dsc.name);
      Get.find<FavoriteController>().addToFav(sc);
    }
  }
  // void getSDinfo(int sid) async{
  //       var rs = await scdrepo.fetch_service_center(iD);

  //   if (rs[0] == 1) {
  //     scdInfo = rs[1];

  //     update();
  //   }
  //   else if (rs[0] == 1){
  //      Get.to(() => LoginPage());
  //   }
  // }
}
