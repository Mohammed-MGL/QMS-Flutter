import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Model/ReservationModel.dart';
import 'package:qms/Repo/ReservationRepo.dart';
import 'package:qms/pages/LoginPage.dart';

class ReservationController extends GetxController {
  ReservationModel reservInfo = ReservationModel();

  ReservationRepo reservRepo = ReservationRepo();

  int pagenum;
  bool is_ThereNext = false;
  bool response = false;

  ScrollController scrollController = ScrollController(
      // initialScrollOffset: 0.0,
      // keepScrollOffset: true,
      );


      
  @override
  void onInit() {
    super.onInit();
    pagenum = 1;
    getReservation();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getReservation();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void getReservation() async {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    pagenum = 1;
    var rs = await reservRepo.getReservation(pagenum);
    if (rs[0] == 1) {
      reservInfo = rs[1];
      is_ThereNext = reservInfo.next;
      update();
    } else if (rs[0] == 1) {
      Get.to(() => LoginPage());
    }
  }
}
