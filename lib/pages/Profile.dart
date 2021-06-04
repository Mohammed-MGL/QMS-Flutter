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
         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.blue[700],
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<AccountController>(builder: (controller) {
        final mypro = controller.userModel;
       return SingleChildScrollView(
         child:Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top:20) ,
               child: Container(child: Text(" Your ID : ${mypro.id}", style: TextStyle(
                          fontSize: 26.0,  fontWeight: FontWeight.bold,
                         color: Colors.blue[700],),),),
             ),
              SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
             Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
               leading: Icon(Icons.person),
                      title: Text('UserName',style: TextStyle(color: Colors.blue[700]),),
                      
                      subtitle: Text(" ${mypro.username}"),      
      ),
    ),
     Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
               leading: Icon(Icons.person),
                      title: Text('First Name', style: TextStyle(color: Colors.blue[700]),),
                      
                      subtitle: Text(" ${mypro.firstName}",),      
      ),
    ), Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
               leading: Icon(Icons.person),
                      title: Text('Last Name',style: TextStyle(color: Colors.blue[700]),),
                     
                      subtitle: Text(" ${mypro.lastName}"),      
      ),
    ), Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
               leading: Icon(Icons.email_rounded),
                      title: Text('Email',style: TextStyle(color: Colors.blue[700]),),
                      
                      subtitle: Text(" ${mypro.email}"),      
      ),
    ),
      SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                    decoration: BoxDecoration(
                       // color: Colors.blue[700].withOpacity(.20),
                      
                   ),
                    child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                child: Text(
                                  "Edit Password",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[700],
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 6.0,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.white,
                                onPressed: (){}
                              ),
                              SizedBox(
                                //height: MediaQuery.of(context).size.width * 0.03,
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[700],
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.white,
                                onPressed: (){}
                              ),
                            ],
                          )
                        
                )],
         ),
       );

        
      }),
    );
  }
}
