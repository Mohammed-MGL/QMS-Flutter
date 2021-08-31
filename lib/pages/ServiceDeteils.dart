//import 'dart:html';
import 'dart:ffi';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceModel.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:flutter/material.dart';

class ServiceDeteils extends StatefulWidget {
  const ServiceDeteils({Key key}) : super(key: key);

  @override
  _ServiceDeteilsState createState() => _ServiceDeteilsState();
}

class _ServiceDeteilsState extends State<ServiceDeteils> {

  @override
  Widget build(BuildContext context) {
 Get.find<ServiceController>().refreshPage();
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(
        selectedItem: 0,
      ),
      appBar: AppBar(
        title: Text('Service Details'.tr,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontSize: 28,
            )),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GetBuilder<ServiceController>(
        
        builder: (controller) {
          // final sInfo = ServiceModel(
          //     id: 1,
          //     isInQ: false,
          //     name: 'name',
          //     queueCount: 5,
          //     waitingTime: "5 min");
          final sInfo = controller.sInfo;
          bool isinq = controller.sInfo.isInQ;
                  

          if (controller.is_loding) {
            return Expanded(child: Center(child: CircularProgressIndicator()));
          }
          return Container(
            width: Get.width,
            child: RefreshIndicator(
              onRefresh: ()async {
                setState(() {
                  
                });
              },
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "${sInfo.scname}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: Colors.blue[700],
                        fontSize: 35,
                        //fontFamily: 'DancingScript',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 15, 8, 20),
                            //alignment: Alignment.center,
                            //  width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${sInfo.name}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).accentColor,
                                fontSize: 32,
                                //fontFamily: 'DancingScript',
                              ),
                            ),
                          ),
                           (sInfo.status == 'P')?
                           Text(
                                      "Pending".tr,
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 28,
                                        //fontFamily: 'DancingScript',
                                      ),
                                    )
                              : Container(),
                           (sInfo.status == 'A')
                                  ? Text(
                                      "User ID".tr,
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 28,
                                        //fontFamily: 'DancingScript',
                                      ),
                                    )
                              : Container(),
                          (sInfo.status == 'A')
                                  ? Text(
                                      "${sInfo.uid}",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 55,
                                        //fontFamily: 'DancingScript',
                                      ),
                                    )
                              : Container(),
                          (!sInfo.isServing)
                              ? Container(
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(top: 10),
                                  width: Get.width * .75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 2),
                                            child: Text(
                                              "${sInfo.queueCount}",
                                              style: TextStyle(
                                                // color: Colors.blue[900],
                                                fontSize: 35,
                                                // fontFamily: 'DancingScript',
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.people_alt_sharp,
                                            size: 40,
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Customers waiting".tr,
                                        style: TextStyle(
                                          // color: Colors.blue[900],
                                          fontSize: 22,
                                          // fontFamily: 'DancingScript',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      "Please go to window ${sInfo.empDeskNumber}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        // color: Colors.blue[900],
                                        fontSize: 23,
                                        // fontFamily: 'DancingScript',
                                      ),
                                    ),
                                  ),
                                ),
                                (sInfo.isServing)?
                                Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      "employee ${sInfo.empName} is waiting for you",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        // color: Colors.blue[900],
                                        fontSize: 23,
                                        // fontFamily: 'DancingScript',
                                      ),
                                    ),
                                  ):Container(),

                          (!sInfo.isServing)
                              ? Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  // color: Colors.red,
                                  width: Get.width * .75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 0, 2),
                                            child: Text(
                                              "${sInfo.waitingTime}",
                                              style: TextStyle(
                                                // color: Colors.blue[900],
                                                fontSize: 35,
                                                // fontFamily: 'DancingScript',
                                              ),
                                            ),
                                          ),
                                          Text("Min"),
                                          Icon(
                                            Icons.access_time,
                                            size: 40,
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Expected waiting time".tr,
                                        style: TextStyle(
                                          // color: Colors.blue[900],
                                          fontSize: 22,
                                          // fontFamily: 'DancingScript',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          // Expanded(child: Container()),
                          (!sInfo.isServing)
                              ? (sInfo.queueCountInSC < sInfo.queueCount)
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 10),
                                      child: Text(
                                        "\"Only ${sInfo.queueCountInSC}" +
                                            " of them are inside the center, it will take + ${sInfo.waitingTimeInCS}+ minutes\"",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : Container()
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(12, 25, 12, 0),
                      // color: Colors.red,
                      // width: 250,
                      // decoration: BoxDecoration(
                      //     color: Colors.blue[700].withOpacity(.20),
                      //     border: Border.all(
                      //       color: Colors.blue[700],
                      //     )),  (sInfo.isServing)
                      child: (isinq)
                          ? (!sInfo.isServing)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: (isinq)
                                              ? () {
                                                  controller.cancelReservation(
                                                      sInfo.id);
                                                }
                                              : null,
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(10),
                                            primary:
                                                Theme.of(context).accentColor,
                                            onPrimary: Colors.red,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Text(
                                            "Cancel".tr,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (!sInfo.isInCenter)
                                      Column(
                                        children: [
                                          ElevatedButton(
                                            onPressed: (isinq)
                                                ? () {
                                                    controller
                                                        .userInCenter(sInfo.id);
                                                  }
                                                : null,
                                            child: Icon(
                                              Icons.emoji_people_rounded,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(10),
                                              primary: Theme.of(context)
                                                  .accentColor, // <-- Button color
                                              onPrimary: Colors
                                                  .red, // <-- Splash color
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              "I arrived".tr,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                )
                              : Container()
                          : ElevatedButton(
                              onPressed: (!isinq)
                                  ? () {
                                      controller.bookInService(sInfo.id);
                                    }
                                  : null,
                              child: Text(
                                "Book Now".tr,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(50),
                                primary: Theme.of(context)
                                    .accentColor, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
                            ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
