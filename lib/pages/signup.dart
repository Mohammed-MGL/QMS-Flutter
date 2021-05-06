import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _pass,
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

  Widget _buildPassword2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        if (value != _pass.text) {
          return 'Passwords do not match';
        }

        return null;
      },
      onSaved: (String value) {
        password2 = value;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'firstName'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'firstName is Required';
        }

        return null;
      },
      onSaved: (String value) {
        firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'lastName'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'lastName is Required';
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
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage(
                  'lib/images/login.jpg',
                )),
                _buildUsername(),
                _buildEmail(),
                _buildPassword(),
                _buildPassword2(),
                _buildFirstName(),
                _buildLastName(),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
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
