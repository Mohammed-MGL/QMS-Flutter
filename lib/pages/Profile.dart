import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/AccountController.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/Translation.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedLang = Translation.langs.first;

    Get.find<AccountController>().getUserInfo();
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 4),
      appBar: AppBar(
        title: Text('Profile'.tr,
            style: TextStyle(
              color: Colors.blue[700],
              //fontFamily: 'DancingScript',
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Text(
                    " Your ID : ${mypro.id}".tr,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
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
                  title: Text(
                    'UserName'.tr,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  subtitle: Text(" ${mypro.username}"),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'First Name'.tr,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  subtitle: Text(
                    " ${mypro.firstName}",
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Last Name'.tr,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  subtitle: Text(" ${mypro.lastName}"),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(Icons.email_rounded),
                  title: Text(
                    'Email'.tr,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
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
                            "Edit Password".tr,
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
                          onPressed: () {}),
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
                            "Log Out".tr,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[700],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.white,
                          onPressed: () {
                            Get.find<AccountController>().logout();
                          }),
                    ],
                  )),
              DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  value: _selectedLang,
                  items: Translation.langs.map((String lang) {
                    return DropdownMenuItem(value: lang, child: Text(lang));
                  }).toList(),
                  onChanged: (String value) {
                    // updates dropdown selected value
                    //setState(() => _selectedLang = value);
                    // gets language and changes the locale
                    Translation().changeLocale(value);
                  }),
            ],
          ),
        );
      }),
    );
  }
}
