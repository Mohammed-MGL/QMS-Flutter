import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/HistoryController.dart';
import 'package:qms/components/MyNavictionBar.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Get.find<HistoryController>().getHistory();

    return Scaffold(
      bottomNavigationBar: MyNavictionBar(
        selectedItem: 3,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        title: Text(
          ' My History'.tr,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DancingScript',
            fontSize: 35,
          ),
        ),
      ),
      body: GetBuilder<HistoryController>(
        builder: (controller) {
          final myHistory = controller.historInfo;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 15.0),
                  child: Text("My Reservation:".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0)),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myHistory.results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          
                          leading: CircleAvatar(
                            radius: Get.width * 0.08,
                            backgroundImage: NetworkImage(
                              myHistory
                                  .results[index].service.serviceCenter.icon,
                            ),
                          ),
                          title: Text(
                              "${myHistory.results[index].service.serviceCenter.name}"),
                          subtitle: Text(
                            "${myHistory.results[index].service.name}",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Text(
                              "${myHistory.results[index].status}"),
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
