import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'package:qms/components/MyNavictionBar.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.find<AccountController>().getUserInfo();
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 4),
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(
              color: Colors.blue[700],
              fontFamily: 'DancingScript',
              fontSize: 28,
            )),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<AccountController>(builder: (controller) {
        final mypro = controller.userModel;
        return SingleChildScrollView(
          child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(" First Name  : ${mypro.firstName}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0)),
                ),
                

        );
      }),
    );
  }
}
