import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceCenterDetailsController.dart';
import 'package:qms/Controllers/ServiceContoller.dart';
import 'package:qms/Model/ServiceCenterDetailsModel.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/components/ServiceCard.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCenterDetailsPage extends StatelessWidget {
  const ServiceCenterDetailsPage({Key key}) : super(key: key);

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 1),
      appBar: AppBar(
        //title: Text('Details Center', style: TextStyle(color: Colors.white)),
        // titleSpacing: 00.0,
        // toolbarHeight: 45.2,

        backgroundColor: Colors.blue[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ServiceCenterDetailsController>(
        builder: (controller) {
          final mySC = controller.scdInfo;
          // final mySC = ServiceCenterDetailsModel(
          //     serviceCenter: ServiceCenter(),
          //     workTime: WorkTime(),
          //     services: [Services(name: "testo")]);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        mySC.serviceCenter.image,
                      ),
                      width: Get.width,
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          mySC.serviceCenter.icon,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name Center : ${mySC.serviceCenter.name}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0)),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Location : ${mySC.serviceCenter.location}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0)),
                        IconButton(
                            icon: Icon(Icons.map),
                            onPressed: () {
                              _launchURL(mySC.serviceCenter.mapLocations);
                            })
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Phone : ${mySC.serviceCenter.phone}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0)),
                ),
                ExpansionTile(
                  backgroundColor: Colors.white24,
                  leading: Icon(Icons.event),
                  title: Text('Work Time'),
                  children: <Widget>[
                    ListTile(title: Text('saturday ${mySC.workTime.saturday}')),
                    ListTile(title: Text('sunday ${mySC.workTime.sunday}')),
                    ListTile(title: Text('monday  ${mySC.workTime.monday}')),
                    ListTile(title: Text('tuesday ${mySC.workTime.tuesday}')),
                    ListTile(
                        title: Text('wednesday ${mySC.workTime.wednesday}')),
                    ListTile(title: Text('thursday ${mySC.workTime.thursday}')),
                    ListTile(title: Text('friday ${mySC.workTime.friday}')),
                  ],
                ),
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
                  itemCount: mySC.services.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ServiceCard(
                        service: mySC.services[index],
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
