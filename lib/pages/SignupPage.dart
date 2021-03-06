import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/pages/LoginPage.dart';
import '../Controllers/AccountController.dart';

class SignupPage extends StatelessWidget {
  String username;
  String password;
  String password2;
  String email;
  String firstName;
  String lastName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  Widget _buildUsername() {
    return TextFormField(
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),

        //labelText: 'Last Name',
        hintText: "User Name".tr,
        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required'.tr;
        }
        return null;
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),

          //labelText: 'Last Name',
          hintText: "Email".tr,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required'.tr;
          }

          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String value) {
          email = value;
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: TextFormField(
        controller: _pass,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),

          //labelText: 'Last Name',
          hintText: "Password".tr,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
        ),
        keyboardType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required'.tr;
          }

          return null;
        },
        onSaved: (String value) {
          password = value;
        },
      ),
    );
  }

  Widget _buildPassword2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),

          //labelText: 'Last Name',
          hintText: "Confirm Password".tr,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
        ),
        keyboardType: TextInputType.visiblePassword,
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

  Widget _buildFirstName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),

          //labelText: 'Last Name',
          hintText: "First Name".tr,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'FirstName is Required'.tr;
          }

          return null;
        },
        onSaved: (String value) {
          firstName = value;
        },
      ),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),

        //labelText: 'Last Name',
        hintText: "Last Name".tr,
        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'LastName is Required'.tr;
        }

        return null;
      },
      onSaved: (String value) {
        lastName = value;
      },
    );
  }

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    print(username);
    print(password);
    print(password2);
    print(email);
    print(firstName);
    print(lastName);

    Get.find<AccountController>().accountRegister(
        username: username,
        password: password,
        password2: password2,
        email: email,
        firstName: firstName,
        lastName: lastName);
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
            title: Text('Sign Up'.tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'DancingScript',
                  fontSize: 28,
                )),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 50.2,
            elevation: 10,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    alignment: Alignment.center,
                    //  width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Inter Your Details :'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'DancingScript',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                //margin: EdgeInsets.all(24),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                      _buildUsername(),
                      _buildEmail(),
                      _buildPassword(),
                      _buildPassword2(),
                      _buildFirstName(),
                      _buildLastName(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.03,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          'Signup'.tr,
                          style: TextStyle(
                            fontSize: 20.0,
                            color:Theme.of(context).accentColor,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0)),
                        color: Colors.white,
                        onPressed: () => _submit(),
                      ),
                      Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                        child: InkWell(
                          child: Text(" Submit ? ".tr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15.0)),
                          onTap: () {
                            Get.offAll(() => LoginPage());
                          },
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
