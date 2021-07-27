import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'package:qms/Controllers/ServiceCentersController.dart';
import 'package:qms/Model/ReservationModel.dart';
import 'package:qms/Repo/AccountRepo.dart';
import 'package:qms/Repo/Storage.dart';
import 'package:qms/pages/FavoritePage.dart';
import 'package:qms/pages/HistoryPage.dart';
import 'package:qms/pages/Profile.dart';
import 'package:qms/pages/ReservationPage.dart';
import 'package:qms/pages/ServiceCentersPage.dart';
import 'package:qms/pages/LoginPage.dart';
import 'package:qms/pages/ServiceDeteils.dart';
import 'package:qms/pages/SignupPage.dart';
import 'package:qms/Translation.dart';
// import './pages/home.dart';
// import './pages/login.dart';
import './pages/welcome1.dart';
//import './pages/Login1.dart';
import 'dependencies.dart';
import 'pages/AccountPage.dart';
import 'pages/ServiceCenterDetailsPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget _defaultHome = LoginPage();

  AccountController account = AccountController();
  bool t = await account.isLogin();
  if (t) {
    _defaultHome = ServiceCentersPage();
  }
  runApp(GetMaterialApp(
     translations:Translation(),
      //locale: Get.deviceLocale,
      locale :Translation.locale,
      fallbackLocale: Translation.fallbackLocale,
      
    smartManagement: SmartManagement.keepFactory,
    initialBinding: Dependencies(),
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    getPages: [
      GetPage(name: 'page0', page: () => ServiceCentersPage(),transition: Transition.noTransition),
      GetPage(name: 'page1', page: () => FavoritePage(),transition: Transition.noTransition),
      GetPage(name: 'page2', page: () => ReservationPage(),transition: Transition.noTransition),
      GetPage(name: "page3", page: () => HistoryPage(),transition: Transition.noTransition),
      GetPage(name: 'page4', page: () => ProfileUser(),transition: Transition.noTransition),
    ],
  ));
}
