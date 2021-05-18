import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'package:qms/Repo/AccountRepo.dart';
import 'package:qms/Repo/Storage.dart';
import 'package:qms/pages/FavoritePage.dart';
import 'package:qms/pages/Reservationpage.dart';
import 'package:qms/pages/ServiceCentersPage.dart';
import 'package:qms/pages/LoginPage.dart';
import 'package:qms/pages/SignupPage.dart';

// import './pages/home.dart';
// import './pages/login.dart';
import './pages/welcome1.dart';
//import './pages/Login1.dart';
import 'dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget _defaultHome = LoginPage();

  AccountController account = AccountController();
  bool t = await account.isLogin();
  if (t) {
    _defaultHome = ServiceCentersPage();
  }
  runApp(GetMaterialApp(
    smartManagement: SmartManagement.keepFactory,
    initialBinding: Dependencies(),
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    getPages: [
        GetPage(name: 'page0', page: () => ServiceCentersPage()),
        GetPage(name: 'page1', page: () => FavoritePage()),
        GetPage(name: 'page2', page: () => Reservationpage()),
        GetPage(name: "page3", page: () => FavoritePage()),
        GetPage(name: 'page4', page: () => FavoritePage()),
        
      ],
  ));
}
