import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/FavoriteController.dart';
import 'package:qms/Controllers/ServiceCentersController.dart';
import 'package:qms/components/MyNavictionBar.dart';
import 'package:qms/components/ServiceCenterCard.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>().getFavList();
    var itemCount = Get.find<FavoriteController>().favSClist.length;
    var serviceCenter = Get.find<FavoriteController>().favSClist;
    return Scaffold(
        bottomNavigationBar: MyNavictionBar(
          selectedItem: 1,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          elevation: 10,
          title: Text(
            ' My Favorite '.tr,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontSize: 35,
            ),
          ),
        ),
        body: GetBuilder<FavoriteController>(builder: (controller) {
          return ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, i) {
                var servID = serviceCenter[i].id;
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    enabled: (serviceCenter[i].isOnline) ? true : false,
                    onTap: (serviceCenter[i].isOnline) ? () {} : null,
                    leading: CircleAvatar(
                      radius: Get.width * 0.08,
                      backgroundImage: NetworkImage(
                        serviceCenter[i].icon,
                      ),
                    ),
                    title: Text(serviceCenter[i].name),
                    subtitle: Text(
                      serviceCenter[i].location,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    trailing: Container(
                      // width: 20,
                      // height: 20,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            
                          });
                          Get.find<FavoriteController>().removFromFav(servID);
                        },
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
