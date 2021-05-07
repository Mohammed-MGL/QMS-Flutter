import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'ServiceCentersPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  String username;
  String password;

  Widget _buildUsername() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'username'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }
        return null;
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    Get.find<AccountController>()
        .accountLogin(username: username, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.deepPurple,
      ),
      //body
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                //styling
                Image(
                    image: AssetImage(
                  'assets/images/login.jpg',
                )),
                _buildUsername(),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'E-Mail',
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //             color: Colors.deepPurple, width: 2.0),
                //         borderRadius: BorderRadius.circular(25.0),
                //       )),
                //   onFieldSubmitted: (value) {},
                //   obscureText: true,
                //   validator: (value) {
                //     if (value.isEmpty ||
                //         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //             .hasMatch(value)) {
                //       return 'Enter a Valid E-Mail!';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                _buildPassword(),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Password',
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //             color: Colors.deepPurple, width: 2.0),
                //         borderRadius: BorderRadius.circular(25.0),
                //       )),
                //   onFieldSubmitted: (value) {},
                //   obscureText: true,
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Enter a valid Password!';
                //     }
                //     return null;
                //   },
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 15.0,
                  ),
                  child: Text(
                    " Submit ",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.deepPurple,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
