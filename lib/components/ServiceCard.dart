import 'package:flutter/material.dart';
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
          onTap: (service.iSActive) ? pressedOn : null,
          leading: Icon(Icons.point_of_sale),
          title: Text(service.name),
          subtitle: Text(
            'انقر للتفاصيل',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
