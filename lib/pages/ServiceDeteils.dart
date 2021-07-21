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
        title: Text('Service Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontSize: 28,
            )),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.blue[700],
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
                              color: Colors.blue[700],
                              fontSize: 35,
                              //fontFamily: 'DancingScript',
                            ),
                          ),
                        ),
                        (isinq)
                            ? Text(
                                "User ID",
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 28,
                                  //fontFamily: 'DancingScript',
                                ),
                              )
                            : Container(),
                        (isinq)
                            ? Text(
                                "0057",
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 55,
                                  //fontFamily: 'DancingScript',
                                ),
                              )
                            : Container(),
                        // Container(
                        //   color: Colors.red,
                        //   width: Get.width * .75,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                        //         child: Text(
                        //           "88",
                        //           style: TextStyle(
                        //             // color: Colors.blue[900],
                        //             fontSize: 35,
                        //             // fontFamily: 'DancingScript',
                        //           ),
                        //         ),
                        //       ),
                        //       Icon(
                        //         Icons.people_alt_sharp,
                        //         size: 35,
                        //       ),
                        //       Text(
                        //         "Customers are waiting",
                        //         style: TextStyle(
                        //           // color: Colors.blue[900],
                        //           fontSize: 22,
                        //           // fontFamily: 'DancingScript',
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: Colors.red,
                        //   width: Get.width * .75,
                        //   child: Row(

                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.fromLTRB(5, 5, 0, 2),
                        //         child: Text(
                        //           "88",
                        //           style: TextStyle(
                        //             // color: Colors.blue[900],
                        //             fontSize: 35,
                        //             // fontFamily: 'DancingScript',
                        //           ),
                        //         ),
                        //       ),
                        //       Text("Min"),
                        //       Icon(
                        //         Icons.access_time,
                        //         size: 35,
                        //       ),
                        //       Text(
                        //         "Expected waiting time",
                        //         style: TextStyle(
                        //           // color: Colors.blue[900],
                        //           fontSize: 22,
                        //           // fontFamily: 'DancingScript',
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                                "Customers waiting",
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
                                "Expected waiting time",
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
                            "\"Only 5 of them are inside the center, it will take 10 minutes\" testt",
                            textAlign: TextAlign.center,
                          ),
                        ):Container(),
                        // Container(
                        //   margin: EdgeInsets.all(12.0),
                        //   height: 170,
                        //   decoration: BoxDecoration(
                        //     color: Colors.blue[700].withOpacity(.20),
                        //     border: Border.all(
                        //       color: Colors.blue[700],
                        //     ),
                        //     shape: BoxShape.circle,
                        //   ),
                        //   //alignment: Alignment.center,
                        //   //  width: MediaQuery.of(context).size.width,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(40.0),
                        //     child: Column(
                        //       children: [
                        //         Text(
                        //           'Total Number:${sInfo.queueCount} ',
                        //           style: TextStyle(
                        //             color: Colors.blue[900],
                        //             fontSize: 14,
                        //             // fontFamily: 'DancingScript',
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height:
                        //               MediaQuery.of(context).size.width * 0.1,
                        //         ),
                        //         Text(
                        //           'WaitingTime:${sInfo.waitingTime}',
                        //           style: TextStyle(
                        //             color: Colors.blue[900],
                        //             fontSize: 14,
                        //             //fontFamily: 'DancingScript',
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.1,
                // ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.15,
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     RaisedButton(
                // padding: EdgeInsets.symmetric(
                //    vertical: 8.0,
                //   horizontal: 15.0,
                //       ),
                //       child: Text(
                //         "Book Now ",
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           color: Colors.blue[700],
                //         ),
                //       ),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20.0)),
                //       color: Colors.white,
                //       onPressed: () {},
                //     ), SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.03,
                // ),
                //     RaisedButton(
                //       padding: EdgeInsets.symmetric(
                //         vertical: 8.0,
                //         horizontal: 15.0,
                //       ),
                //       child: Text(
                //         " Delete Book",
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           color: Colors.blue[700],
                //         ),
                //       ),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20.0)),
                //       color: Colors.white,
                //       onPressed: () {},

                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.2,
                // ),
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
                                      primary: Colors.blue, // <-- Button color
                                      onPrimary: Colors.red, // <-- Splash color
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blue[700],
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
                                      primary: Colors.blue, // <-- Button color
                                      onPrimary: Colors.red, // <-- Splash color
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "I arrived",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // MaterialButton(
                              //   child: Text(
                              //     " Delete Book ",
                              //     style: TextStyle(
                              //       fontSize: 20.0,
                              //       color: Colors.blue[700],
                              //     ),
                              //   ),
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: 6.0,
                              //     horizontal: 6.0,
                              //   ),
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20.0)),
                              //   color: Colors.white,
                              //   onPressed: (isinq)
                              //       ? () {
                              //           controller.cancelReservation(sInfo.id);
                              //         }
                              //       : null,
                              // ),
                              // SizedBox(
                              //   //height: MediaQuery.of(context).size.width * 0.03,
                              //   width: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              // MaterialButton(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: 6.0,
                              //     horizontal: 20.0,
                              //   ),
                              //   child: Text(
                              //     " I arrived ",
                              //     style: TextStyle(
                              //       fontSize: 20.0,
                              //       color: Colors.blue[700],
                              //     ),
                              //   ),
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(20.0),
                              //   ),
                              //   color: Colors.white,
                              //   onPressed: (isinq)
                              //       ? () {
                              //           controller.userInCenter(sInfo.id);
                              //         }
                              //       : null,
                              // ),
                            ],
                          ):Container()
                        : ElevatedButton(
                            onPressed: (!isinq)
                                ? () {
                                    controller.bookInService(sInfo.id);
                                  }
                                : null,
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(50),
                              primary: Colors.blue, // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                          )
                    // Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: MaterialButton(
                    //       //disabledColor: Colors.grey,
                    //       disabledTextColor: Colors.grey,
                    //       padding: EdgeInsets.symmetric(
                    //         vertical: 10.0,
                    //         horizontal: 15.0,
                    //       ),
                    //       child: Text(
                    //         "Book Now ",
                    //         style: TextStyle(
                    //           fontSize: 20.0,
                    //           color: Colors.blue[700],
                    //         ),
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20.0)),
                    //       color: Colors.white,
                    //       onPressed: (!isinq)
                    //           ? () {
                    //               controller.bookInService(sInfo.id);
                    //             }
                    //           : null,
                    //     ),
                    //   ),
                    ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.03,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
