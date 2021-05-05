import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import './pages/home.dart';
// import './pages/login.dart';
import './pages/welcome.dart';
import 'dependencies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      initialBinding: Dependencies(),
      
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

