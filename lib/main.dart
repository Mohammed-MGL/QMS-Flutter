import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'package:qms/pages/ServiceCentersPage.dart';
import 'package:qms/pages/LoginPage.dart';
import 'package:qms/Translation.dart';
import 'dependencies.dart';
import 'firebase/cloud_messaging/messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MessagingService().initMessaging();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Widget _defaultHome = LoginPage();

  AccountController account = AccountController();
  bool t = await account.isLogin();
  if (t) {
    _defaultHome = ServiceCentersPage();
  }
  
  runApp(GetMaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xff4a0072),
      // primaryColor:   Colors.purple[500],
      accentColor: Color(0xff7b1fa2),
    ),
    //locale: Get.deviceLocale,
    locale: Translation.locale,
    fallbackLocale: Translation.fallbackLocale,
    translations: Translation(),

    smartManagement: SmartManagement.keepFactory,
    initialBinding: Dependencies(),
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    // getPages: [
    //   GetPage(name: 'page0', page: () => ServiceCentersPage(),transition: Transition.noTransition),
    //   GetPage(name: 'page1', page: () => FavoritePage(),transition: Transition.noTransition),
    //   GetPage(name: 'page2', page: () => ReservationPage(),transition: Transition.noTransition),
    //   GetPage(name: "page3", page: () => HistoryPage(),transition: Transition.noTransition),
    //   GetPage(name: 'page4', page: () => ProfileUser(),transition: Transition.noTransition),
    // ],
  ));
}
