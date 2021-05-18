//import 'dart:html';
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
        titleSpacing: 00.0,
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
          bool isinq =true;
           final sInfo = controller.sInfo;
          //final sInfo =ServiceModel();

          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  //alignment: Alignment.center,
                  //  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '${sInfo.name} ',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 35,
                      //fontFamily: 'DancingScript',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.blue[700].withOpacity(.20),
                    border: Border.all(
                      color: Colors.blue[700],
                    ),
                    shape: BoxShape.circle,
                  ),
                  //alignment: Alignment.center,
                  //  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Text(
                          'Total Number:${sInfo.queueCount} ',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 14,
                            // fontFamily: 'DancingScript',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(
                          'WaitingTime:${sInfo.waitingTime}',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 14,
                            //fontFamily: 'DancingScript',
                          ),
                        ),
                      ],
                    ),
                  ),
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                Container( 
                    decoration: BoxDecoration( color: Colors.blue[700].withOpacity(.20),
                        border: Border.all(
                      color: Colors.blue[700],
                    )),
                    child: (isinq)
                        ? Row( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                child: Text(
                                  " Delete Book ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[700],
                                    
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                           vertical: 6.0,
                          horizontal: 6.0,),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.white,
                                onPressed: (isinq)
                                    ? () {
                                        controller.cancelReservation(sInfo.id);
                                      }
                                    : null,
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
                                  " I arrived ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue[700],
                                  ),
                                ),
                                
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.white,
                                
                                onPressed: (isinq)
                                    ? () {
                                        controller.userInCenter(sInfo.id);
                                      }
                                    : null,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  //disabledColor: Colors.grey,
                                  disabledTextColor: Colors.grey,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
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
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  color: Colors.white,
                                  onPressed: (!isinq)
                                      ? () {
                                          controller.bookInService(sInfo.id);
                                        }
                                      : null,
                                ),
                              ),
                            ],
                          )),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
