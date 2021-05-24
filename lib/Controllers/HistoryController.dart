import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Model/HistoryModel.dart';
import 'package:qms/Repo/HistoryRepo.dart';
import 'package:qms/pages/LoginPage.dart';

class HistoryController extends GetxController {
  HistoryModel historInfo = HistoryModel();
  HistoryRepo historRepo = HistoryRepo();

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
    getHistory();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getNextPage();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void getHistory() async {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    pagenum = 1;
    var rs = await historRepo.getHistory(pagenum);
    if (rs[0] == 1) {
      historInfo = rs[1];
      is_ThereNext = historInfo.next;
      update();
    } else if (rs[0] == 1) {
      Get.to(() => LoginPage());
    }
  }

  void getNextPage() async {
    if (is_ThereNext) {
      pagenum++;
      var rs = await historRepo.getHistory(pagenum);
      if (rs[0] == 1) {
        HistoryModel temp = rs[1];
        is_ThereNext = temp.next;
        historInfo.results.addAll(temp.results);
        update();
      } else if (rs[0] == 2) {
        Get.to(() => LoginPage());
      }
    }
  }

}
