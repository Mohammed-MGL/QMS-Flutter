import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ReservationController.dart';
import 'package:qms/Controllers/ServiceCenterDetailsController.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceCenterDetailsModel.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/components/ServiceCard.dart';

class Reservationpage extends StatelessWidget {
  const Reservationpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 2),
      appBar: AppBar(
        //title: Text('Details Center', style: TextStyle(color: Colors.white)),
        // titleSpacing: 00.0,
        // toolbarHeight: 45.2,

        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ReservationController>(
        builder: (controller) {
          final myReserv = controller.reservInfo;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 15.0),
                  child: Text("Services:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0)),
                ),
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
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Text(
                              "${myReserv.results[index].service.qdetails.customersNum}\n ${myReserv.results[index].service.qdetails.waitingtime}"),
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
