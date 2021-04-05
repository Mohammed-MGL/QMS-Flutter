import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({Key key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-Up', style: TextStyle(color: Colors.white)),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.deepPurple,),
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
                  'lib/images/login.jpg',
                )),

                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid  First Name!';
                    }
                    return null;
                  },
                ),
                //box styling

                //text input
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid  Last Name!';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone'),
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid Phone!';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid Password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
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
                  onPressed: () => _submit(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
