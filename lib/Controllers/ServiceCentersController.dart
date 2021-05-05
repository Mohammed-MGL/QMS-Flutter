import '../Model/ServiceCentersModel.dart';
import '../Repo/ServiceCentersRepo.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class ServiceCentersController extends GetxController {
  ServiceCentersModel scModel = ServiceCentersModel();
  ServiceCentersRepo scRepo = ServiceCentersRepo();
  int pagenum;
  String searchWord;
  bool finish = false;
  bool response = false;
  bool is_Searching = false;
  double containerWidth = 0;
  double containerheight = 0;

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagenum = 1;
    getAllServiceCenters();

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

  void getAllServiceCenters() async {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    pagenum = 1;
    is_Searching = false;

    scModel = await scRepo.getAllServiceCenters(pagenum);
    response = true;
    if (scModel.next) {
      finish = false;
    } else
      finish = true;
    update();
  }

  void getNextPage() async {
    if (!finish) {
      pagenum++;
      ServiceCentersModel temp = await scRepo.getAllServiceCenters(pagenum);
      if (scModel.next) {
        scModel.next = temp.next;
        finish = false;
        scModel.results.addAll(temp.results);
        update();
      } else {
        finish = true;
        print("finish");
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
      scModel = await scRepo.searchForServiceCenters(searchWord, pagenum);
      response = true;
      if (scModel.next) {
        finish = false;
      } else
        finish = true;
      update();
    }
  }

  void getNextSearchPage() async {
    if (!finish) {
      pagenum++;
      ServiceCentersModel temp =
          await scRepo.searchForServiceCenters(searchWord, pagenum);

      if (scModel.next) {
        scModel.next = temp.next;
        finish = true;
      } else
        finish = false;
      scModel.results.addAll(temp.results);
      update();
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
}
