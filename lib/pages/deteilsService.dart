import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceContoller.dart';

class Deteils extends StatelessWidget {
  const Deteils({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.blue[700].withOpacity(.60),
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
      ),
      appBar: AppBar(
        title: Text('Service Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontSize: 28,
            )),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.blue[700],
      ),
      body: GetBuilder<ServiceController>(
        builder: (controller) {
          final sInfo = controller.sInfo;
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  alignment: Alignment.center,
                  //  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '${sInfo.serviceName} ',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 35,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  alignment: Alignment.center,
                  //  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Total Number: ${sInfo.queueCount} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Text(
                        "Book Now ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[700],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Text(
                        " Delete Book",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[700],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          //alignment: Alignment.center,
                          //  width: MediaQuery.of(context).size.width,
                          child: Text(
                            'If you are in the center, press the Button',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'DancingScript',
                            ),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Text(
                        "I arrived ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[700],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      //}
    );
  }
}
