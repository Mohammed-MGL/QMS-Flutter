import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        //color: Colors.grey,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: pressedOn,
                leading: Image(
                  //lina
                  image: NetworkImage(
                    //serviceCenter.img
                      "https://domainmundo.com/domain-logos/default-logo.jpg"),
                ),
                title: Text(serviceCenter.name),
                subtitle: Text(
                  serviceCenter.location,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,

                    decoration: BoxDecoration(
                      color: Colors.green,

                      border: Border.all(
                        color: Colors.green,
                      ), //Border.all
                      borderRadius: BorderRadius.circular(200),
                    ), //BoxDecoration
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
