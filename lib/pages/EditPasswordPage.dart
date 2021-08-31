import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';

class EditPasswordPage extends StatelessWidget {
  String old_password;
  String password;
  String password2;

  EditPasswordPage({Key key}) : super(key: key);
  TextEditingController _pass = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  Widget _oldpassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: "Old Password".tr,
            hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required'.tr;
            }

            return null;
          },
          onSaved: (String value) {
            old_password = value;
          }),
    );
  }

  Widget _newPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          controller: _pass,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(20.0),
              borderSide: new BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),

            //labelText: 'Last Name',
            hintText: "New Password".tr,
            hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required'.tr;
            }

            return null;
          },
          onSaved: (String value) {
            password = value;
          }),
    );
  }

  Widget _confirmpassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "Confirm Password".tr,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return ' Confirm Password is Required'.tr;
          }
          if (value != _pass.text) {
            return 'Password do not match'.tr;
          }

          return null;
        },
        onSaved: (String value) {
          password2 = value;
        },
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    Get.find<AccountController>().changePass(old_password, password, password2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/b.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Edit Password',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'DancingScript',
                  fontSize: 28,
                )),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 60.2,
            elevation: 10,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'You can Change your password: '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'DancingScript',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.19,
                      ),
                      Container(
                        height: Get.height * .50,
                        width: Get.width * .90,
                        child: Center(
                          child: Card(
                            color: Colors.white12,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _oldpassword(),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                    ),
                                    _newPassword(),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                    ),
                                    _confirmpassword(),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.13,
                      ),
                      MaterialButton(
                        child: Text(
                          "Change Password".tr,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 6.0,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.white,
                        onPressed: () => _submit(),
                      ),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }
}
