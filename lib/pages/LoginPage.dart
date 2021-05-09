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
      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide( ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),

                          //labelText: 'Last Name',
                          hintText: "User Name",
                          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        ),
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
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        ),
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
            title: Text('LOG IN',
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(
                       height: MediaQuery.of(context).size.width * 0.1,
                    ),
              Container(
                alignment: Alignment.center,
                //  width: MediaQuery.of(context).size.width,
                child: Text(
                  'Welcome Back ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
               SizedBox(
                       height: MediaQuery.of(context).size.width * 0.10,
                    ),
                //styling
                // Image(
                //     image: AssetImage(
                //   'assets/images/login.jpg',
                // )),
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
                Center(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    child: Text(
                      " Submit ",
                      style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[700],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.white,
                    onPressed: _submit,
                  ),
                  
                ),
                 SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      
                            Center(
                              child: InkWell(child:
                                  Text( 'Forget Password? ',
                        style: TextStyle(
                                  color: Colors.white,
                                  
                                  fontSize: 15.0)),onTap: (){},
                              ),
                            ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
