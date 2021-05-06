import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'signup.dart';

class Welcome extends StatelessWidget {
  Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(
        title: Text("Welcome To MGL-Q", style: TextStyle(color: Colors.white)),
         titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Thanks For Using Our App :)",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
            Image(
                image: AssetImage(
                  'assets/images/welcome.jpg' ,
            )),
            SizedBox(height: size.height * 0.05),
            MaterialButton(padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
              onPressed: () {
                Get.to(() => Login());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                '  Login  ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: Colors.deepPurple,
            ),
            SizedBox(height: size.height * 0.01),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
              onPressed: () {
                Get.to(SignupPage());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
