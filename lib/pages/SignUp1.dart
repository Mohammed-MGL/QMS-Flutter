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
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/g.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Sign Up',
              style: TextStyle(
                color: Colors.blue[700],
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
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.center,
                  //  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Inter Your Details :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                ),
                
              ),
               SizedBox(
                       height: MediaQuery.of(context).size.width * 0.03,
                    ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //styling
                      Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child:
                          //text input
                          TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder:  OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                            
                              color: Colors.white,
                            ), 
                          ),
                      
                           //labelText: 'Last Name',
                          hintText: "First Name",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                         
                        ),
                        onFieldSubmitted: (value) {},
                        //obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid  First Name!';
                          }
                          return null;
                        },
                      ),
                    ),
                    //box styling
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child:
                          //text input
                          TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder:  OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                            
                              color: Colors.white,
                            ), 
                          ),
                      
                           //labelText: 'Last Name',
                          hintText: "Last Name",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                         
                        ),
                        onFieldSubmitted: (value) {},
                        //obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid  Last Name!';
                          }
                          return null;
                        },
                      ),
                    ),
                     Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child:
                          //text input
                          TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder:  OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                            
                              color: Colors.white,
                            ), 
                          ),
                      
                           //labelText: 'Last Name',
                          hintText: "Phone",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                         
                        ),
                        onFieldSubmitted: (value) {},
                        //obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid Phone!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child:   TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder:  OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                            
                              color: Colors.white,
                            ), 
                          ),
                      
                           //labelText: 'Last Name',
                          hintText: "Password",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                         
                        ),
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid Password!';
                          }
                          return null;
                        },
                      ),
                    ),
                     Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child:   TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          enabledBorder:  OutlineInputBorder(
                           borderRadius: new BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                            
                              color: Colors.white,
                            ), 
                          ),
                      
                           //labelText: 'Last Name',
                          hintText: " Confirm Password",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                         
                        ),
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a valid Password!';
                          }
                          return null;
                        },
                      ),
                    ),
                     SizedBox(
                       height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        " Submit ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[700],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)),
                      color: Colors.white,
                      onPressed: () => _submit(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
