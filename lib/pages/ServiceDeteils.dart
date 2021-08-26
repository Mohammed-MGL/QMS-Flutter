//import 'dart:html';
import 'dart:ffi';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceModel.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:flutter/material.dart';

class ServiceDeteils extends StatelessWidget {
  const ServiceDeteils({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

          return Container(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${sInfo.scname}",
                  style: TextStyle(
                    // color: Colors.blue[700],
                    fontSize: 35,
                    //fontFamily: 'DancingScript',
                  ),
                ),

                Container(
                  height: Get.height * .50,
                  width: Get.width * .75,
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
                              color:Theme.of(context).accentColor,
                              fontSize: 35,
                              //fontFamily: 'DancingScript',
                            ),
                          ),
                        ),
                        (isinq)
                            ? Text(
                                "User ID".tr,
                                style: TextStyle(
                                  color:Theme.of(context).accentColor,
                                  fontSize: 28,
                                  //fontFamily: 'DancingScript',
                                ),
                              )
                            : Container(),
                        (isinq)
                            ? Text(
                                "${sInfo.uid}",
                                style: TextStyle(
                                  color:Theme.of(context).accentColor,
                                  fontSize: 55,
                                  //fontFamily: 'DancingScript',
                                ),
                              )
                            : Container(),
                      
                        (!sInfo.isServing)?Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(top: 10),
                          width: Get.width * .75,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 2),
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
                        ):Expanded(child: Center(
                          child: Container(
                            
                            child: Text("Please go to window ${sInfo.empDeskNumber}, employee ${sInfo.empName} is waiting for you" ,textAlign: TextAlign.center,style: TextStyle(
                                      // color: Colors.blue[900],
                                      fontSize: 23,
                                      // fontFamily: 'DancingScript',
                                    ),),
                          ),
                        ),),
                        (!sInfo.isServing)?Container(
                          margin: const EdgeInsets.only(top: 20),
                          // color: Colors.red,
                          width: Get.width * .75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 0, 2),
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
                        ):Container(),
                        Expanded(child: Container()),
                        (!sInfo.isServing)?Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                          child: Text(
                            "\"Only ${sInfo.queueCountInSC}"+" of them are inside the center, it will take + ${sInfo.waitingTimeInCS}+ minutes\" testt",
                            textAlign: TextAlign.center,
                          ),
                        ):Container(),
                       
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
                        ?  (!sInfo.isServing)? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: (isinq)
                                        ? () {
                                            controller
                                                .cancelReservation(sInfo.id);
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
                                      primary: Theme.of(context).accentColor, // <-- Button color
                                      onPrimary: Colors.red, // <-- Splash color
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "Cancel".tr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              if(! sInfo.isInCenter ) Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: (isinq)
                                        ? () {
                                            controller.userInCenter(sInfo.id);
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
                                      primary:Theme.of(context).accentColor, // <-- Button color
                                      onPrimary: Colors.red, // <-- Splash color
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "I arrived".tr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color:  Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            
                            ],
                          ):Container()
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
                              primary:Theme.of(context).accentColor, // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                          )
                   
                    ),
               
              ],
            ),
          );
        },
      ),
    );
  }
}
