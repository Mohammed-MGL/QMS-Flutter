import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'QrPage.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: my_naviction_bar(),
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      //AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        Get.to(() => QrPage(),transition: Transition.fadeIn);
                      }),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 14.0, height: 1.0, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Let's search to service center",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          onPressed: () {},
                          alignment: Alignment.bottomRight,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // bottomNavigationBar: ,
  }
}

class my_naviction_bar extends StatelessWidget {
  const my_naviction_bar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          label: ('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: ('Favorite'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: ('Profile'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
