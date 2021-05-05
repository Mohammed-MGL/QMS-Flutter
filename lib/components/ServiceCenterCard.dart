import 'package:flutter/material.dart';

import '../Model/ServiceCentersModel.dart';

class ServiceCenterCard extends StatelessWidget {
  Results serviceCenter;
  ServiceCenterCard({
    Key key,
    this.serviceCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Image(
            //lina 
            image: AssetImage("https://domainmundo.com/domain-logos/default-logo.jpg"),
          ),
          title: Text(serviceCenter.name),
          subtitle: Text(
            serviceCenter.location,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
