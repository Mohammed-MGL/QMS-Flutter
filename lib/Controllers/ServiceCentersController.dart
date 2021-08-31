import 'dart:io';

import 'package:qms/pages/LoginPage.dart';
import 'package:qms/pages/ServiceCenterDetailsPage.dart';

import '../Model/ServiceCentersModel.dart';
import '../Repo/ServiceCentersRepo.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'ServiceCenterDetailsController.dart';

class ServiceCentersController extends GetxController {
  ServiceCentersModel scModel = ServiceCentersModel();
  ServiceCentersRepo scRepo = ServiceCentersRepo();
  int pagenum;
  String searchWord;
  bool is_ThereNext = false;
  bool is_loding = true;
  bool response = false;
  bool is_Searching = false;
  double containerWidth = 0;
  double containerheight = 0;
  bool Ent = true;

  ScrollController scrollController = ScrollController(
      // initialScrollOffset: 0.0,
      // keepScrollOffset: true,
      );

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagenum = 1;
    // getAllServiceCenters();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (is_Searching)
          getNextSearchPage();
        else
          getNextPage();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // @override
  // void onReady() {
  //   getAllServiceCenters();
  //   super.onReady();
  // }

  getAllServiceCenters() async {
    is_loding = true;
         update();

    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    pagenum = 1;
    is_Searching = false;
     Ent = true;
     update();
     var rs ;
    try {
       rs = await scRepo.getAllServiceCenters(pagenum);
    } on SocketException {
      Ent = false;
      is_loding = false;
      update();
      return;
    }
    if (rs[0] == 1) {
      scModel = rs[1];
      response = true;

      is_ThereNext = scModel.next;
      is_loding = false;

      update();
    } else if (rs[0] == 2) {
      Get.offAll(() => LoginPage());
    }
  }

  void getNextPage() async {
    if (is_ThereNext) {
      pagenum++;
      var rs = await scRepo.getAllServiceCenters(pagenum);
      if (rs[0] == 1) {
        ServiceCentersModel temp = rs[1];
        is_ThereNext = temp.next;
        scModel.results.addAll(temp.results);
        update();
      } else if (rs[0] == 2) {
        Get.offAll(() => LoginPage());
      }
    }
  }

  void searchForServiceCenters() async {
    if (searchController.text.length > 0) {
      containerWidth = Get.width * .65;
      containerheight = Get.height * .05;
      update();

      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      pagenum = 1;
      is_Searching = true;
      searchWord = searchController.text;
      print("object==" + searchWord);
      var rs = await scRepo.searchForServiceCenters(searchWord, pagenum);
      if (rs[0] == 1) {
        scModel = rs[1];
        response = true;
        if (scModel.next) {
          is_ThereNext = true;
        } else
          is_ThereNext = false;
        update();
      } else if (rs[0] == 2) {
        Get.offAll(() => LoginPage());
      }
    } else
      cancelSearch();
  }

  void getNextSearchPage() async {
    if (is_ThereNext) {
      pagenum++;
      var rs = await scRepo.searchForServiceCenters(searchWord, pagenum);
      if (rs[0] == 1) {
        ServiceCentersModel temp = rs[1];

        is_ThereNext = temp.next;
        scModel.results.addAll(temp.results);
        update();
      }
    }
  }

  void cancelSearch() {
    searchController.clear();
    containerWidth = 0;
    containerheight = 0;

    getAllServiceCenters();
  }

  void retryGetingServiceCenters() async {
    if (!is_Searching)
      getAllServiceCenters();
    else
      searchForServiceCenters();
  }

  Future<void> selectServiceCenter(int scId) async {
    await Get.find<ServiceCenterDetailsController>().getSCDInfo(scId);
    Get.to(() => ServiceCenterDetailsPage());
  }
}
