import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceCenterDetailsController.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/components/ServiceCard.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCenterDetailsPage extends StatefulWidget {
  const ServiceCenterDetailsPage({Key key}) : super(key: key);

  @override
  _ServiceCenterDetailsPageState createState() => _ServiceCenterDetailsPageState();
}

class _ServiceCenterDetailsPageState extends State<ServiceCenterDetailsPage> {
  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
     Get.find<ServiceCenterDetailsController>().refreshPage();
    return Scaffold(
      bottomNavigationBar: MyNavictionBar(selectedItem: 0),
      appBar: AppBar(
        //title: Text('Details Center', style: TextStyle(color: Colors.white)),
        // titleSpacing: 00.0,
        // toolbarHeight: 45.2,

        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.find<ServiceCenterDetailsController>().addToFav();
            },
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

          return (controller.is_loding??true)
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : RefreshIndicator(
                onRefresh: ()async{
                  setState(() {
                    
                  });
                },
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.size.height*.25,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image(
                            image: NetworkImage(
                              mySC.serviceCenter.image,
                            ),
                            width: Get.width,
                            height: Get.height * .25,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: -35,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      color: Colors.black87,
                                      spreadRadius: 2)
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  mySC.serviceCenter.icon,
                                ),
                                // child: Container(
                                //   color: Colors.red,
                                // ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -65,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${mySC.serviceCenter.name}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Location :".tr +
                                          " ${mySC.serviceCenter.location}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  // Card(
                                  //   elevation: 2,
                                  //   margin: EdgeInsets.all(0),
                                  //   child: IconButton(
                                  //       icon: Icon(Icons.location_on_rounded),
                                  //       color: Theme.of(context).accentColor,
                                  //       onPressed: () {
                                  //         print("object");
                                  //         _launchURL(mySC
                                  //             .serviceCenter.mapLocations);
                                  //       }),
                                  // )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Text(
                                    "Phone".tr +
                                        ": ${mySC.serviceCenter.phone}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16.0)),
                              ),
                            ),
                            ExpansionTile(
                              backgroundColor: Colors.white24,
                              leading: Icon(Icons.event),
                              title: Text('Working Hours'.tr),
                              children: <Widget>[
                                ListTile(
                                    title: Text('saturday'.tr +" : "+
                                        '${mySC.workTime.saturday}')),
                                ListTile(
                                    title: Text('sunday'.tr +" : "+
                                        '${mySC.workTime.sunday}')),
                                ListTile(
                                    title: Text('monday'.tr + " : "+
                                        ' ${mySC.workTime.monday}')),
                                ListTile(
                                    title: Text('tuesday'.tr +" : "+
                                        ' ${mySC.workTime.tuesday}')),
                                ListTile(
                                    title: Text('wednesday'.tr +" : "+
                                        '${mySC.workTime.wednesday}')),
                                ListTile(
                                    title: Text('thursday'.tr +" : "+
                                        ' ${mySC.workTime.thursday}')),
                                ListTile(
                                    title: Text('friday'.tr +" : "+
                                        '${mySC.workTime.friday}')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 10.0, bottom: 8.0, left: 15.0),
                      child: Text("Services:".tr,
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
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
