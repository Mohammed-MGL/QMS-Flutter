import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceCenterDetailsModel.dart';

class ServiceCard extends StatelessWidget {
  final Services service;
  final Function pressedOn;

  ServiceCard({
    Key key,
    this.service,
    this.pressedOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          enabled: service.iSActive,
          onTap: (service.iSActive)
              ? () {
                  Get.find<ServiceController>().getServiceDetails(service.id);
                }
              : null,
          leading: Icon(Icons.image),
          title: Text(service.name),
          subtitle: Text(
            'انقر للتفاصيل',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          trailing:(service.iSActive)? Text(
              "${service.qdetails.customersNum}\n ${service.qdetails.waitingtime}"):
              Text("Offline"),
        ),
      ),
    );
  }
}
