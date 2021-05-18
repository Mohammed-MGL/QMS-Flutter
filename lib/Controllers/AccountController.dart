import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceCentersController.dart';
import 'package:qms/Repo/Storage.dart';
import 'package:qms/pages/ServiceCentersPage.dart';

// import '../Model/UserModel.dart';

import 'package:qms/Repo/AccountRepo.dart';

class AccountController extends GetxController {
  // ServiceCenterDetailsModel scdInfo = ServiceCenterDetailsModel();

  Storage storage = Storage();

  AccountRepo accountRepo = AccountRepo();

  void accountRegister({
    @required String username,
    @required String password,
    @required String password2,
    @required String email,
    @required String firstName,
    @required String lastName,
  }) async {
    List res = await accountRepo.accountRegister(
        username: username,
        password: password,
        password2: password2,
        email: email,
        firstName: firstName,
        lastName: lastName);

    if (res[0]) {
      print("UserModel u = res[1];");
      Get.to(() => ServiceCentersPage());
    } else {
      Map<String, dynamic> responseMap = res[1];

      String errorMsg = "";
      responseMap.forEach((k, v) {
        errorMsg += "$k : $v \n";
      });
      Get.defaultDialog(
        title: "Error",
        content: Text(errorMsg),
      );
    }

    update();
  }

  void accountLogin({
    @required String username,
    @required String password,
  }) async {
    List res = await accountRepo.accountLogin(
      username: username,
      password: password,
    );

    if (res[0]) {
      Get.find<ServiceCentersController>().getAllServiceCenters();
      Get.to(() => ServiceCentersPage());
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text(res[1]),
      );
    }

    update();
  }

  Future<bool> isLogin() async {
    String token = await storage.readToken();
    if (token != '') return true;
    return false;
  }

  void logout() {
    Storage s = Storage();
    s.deleteToken();
  }
}
