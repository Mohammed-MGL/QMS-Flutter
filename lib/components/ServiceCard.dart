import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  ServiceCard({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Icon(Icons.point_of_sale),
          title: Text(name),
          subtitle: Text(
            'انقر للتفاصيل',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}

