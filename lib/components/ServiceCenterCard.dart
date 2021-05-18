import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/ServiceCentersModel.dart';

class ServiceCenterCard extends StatelessWidget {
  final Results serviceCenter;
  final Function pressedOn;

  ServiceCenterCard({
    Key key,
    this.pressedOn,
    this.serviceCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: ListTile(

        
        enabled: (serviceCenter.isOnline) ? true : false,
        onTap: (serviceCenter.isOnline) ? pressedOn : null,
        leading: CircleAvatar(
          radius: Get.width * 0.08,
          backgroundImage: NetworkImage(
            serviceCenter.icon,
          ),
        ),
        title: Text(serviceCenter.name),
        subtitle: Text(
          serviceCenter.location,
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
        trailing: Container(
          margin:EdgeInsets.only(top: 35) ,
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: (serviceCenter.isOnline) ? Colors.green : Colors.red,
            border: Border.all(
              color: (serviceCenter.isOnline) ? Colors.green : Colors.red,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
