import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ReservationController.dart';
import 'package:qms/Controllers/ServiceCenterDetailsController.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceCenterDetailsModel.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/components/ServiceCard.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    Get.find<ReservationController>().getReservation();
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 2),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        title: Text(
          ' My Reservation'.tr,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DancingScript',
            fontSize: 35,
          ),
        ),
      ),
      body: GetBuilder<ReservationController>(
        builder: (controller) {
          final myReserv = controller.reservInfo;
          if (controller.is_loding) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: ListView(
                children: [
                  if (myReserv.results.length == 0) Expanded(child:  Text("No reservations yet",style: TextStyle(fontSize: 25),)),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myReserv.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: ListTile(
                            onTap: () {
                              Get.find<ServiceController>().getServiceDetails(
                                  myReserv.results[index].service.id);
                            },
                            leading: CircleAvatar(
                              radius: Get.width * 0.08,
                              backgroundImage: NetworkImage(
                                myReserv
                                    .results[index].service.serviceCenter.icon,
                              ),
                            ),
                            title: Text(
                                "${myReserv.results[index].service.serviceCenter.name}"),
                            subtitle: Text(
                              "${myReserv.results[index].service.name}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            // trailing: Text(
                            //     "${myReserv.results[index].service.qdetails.customersNum}\n ${myReserv.results[index].service.qdetails.waitingtime}"),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
          );
        },
      ),
    );
  }
}
