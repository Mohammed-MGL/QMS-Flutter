import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/pages/LoginPage.dart';
//import 'package:qms/pages/deteilsService.dart';
import 'package:qms/pages/SignupPage.dart';

import 'ServiceDeteils.dart';


//import 'SignUp1.dart';
//import 'login.dart';
//import 'signup.dart';

class Welcome extends StatelessWidget {
  Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       Get.find<ServiceController>().getServiceDetails(1);

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/g.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(alignment: Alignment.center,
                child: Text(
                  'Q M S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
                 SizedBox(height: size.height * 0.10),
               Container(alignment: Alignment.center,
              //  width: MediaQuery.of(context).size.width,
                child: Text(
                  'Thanks For Using Our App :)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
               SizedBox(height: size.height * 0.25),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 34.0,
              ),
              onPressed: () {
                 Get.to(() => ServiceDeteils());
              },
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.blue[700],
                ),
              ),
            color:  Colors.white,
            ),
              SizedBox(height: size.height * 0.04),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 40.0,
              ),
              onPressed: () {
               Get.to(() => LoginPage());
              },
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.blue[700],
                ),
              ),
              color: Colors.white,
            ),
            ],
          ),
        ),
      ],
    );
  }
}












