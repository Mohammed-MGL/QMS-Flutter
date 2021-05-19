import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Controllers/ServiceCentersController.dart';
import 'package:get/get.dart';

import 'QrPage.dart';
import '../components/MyNavictionBar.dart';
import '../components/NetWorkError.dart';
import '../components/ServiceCenterCard.dart';

class ServiceCentersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<ServiceCentersController>().cancelSearch();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: MyNavictionBar(
        selectedItem: 0,
      ),
      appBar: AppBar(
        title: Text('Services Center',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontSize: 28,
            )),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        elevation: 10,
        backgroundColor: Colors.blue[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {},
          // )
        ],
      ),
      body: GetBuilder<ServiceCentersController>(builder: (scController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Colors.blue[700],
                      ),
                      onPressed: () {
                        Get.to(() => QrPage(), transition: Transition.fadeIn);
                      }),
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (_) {
                        scController.searchForServiceCenters();
                      },
                      controller: scController.searchController,
                      style: TextStyle(
                          fontSize: 14.0, height: 1.0, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Let's search to service center",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          onPressed: scController.searchForServiceCenters,
                          alignment: Alignment.bottomRight,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (scController.response)
              Expanded(
                child: Column(
                  children: [
                    if (scController.scModel.results.length > 0)
                      Expanded(
                        flex: 10,
                        child: ListView.builder(
                          controller: scController.scrollController,
                          shrinkWrap: true,
                          itemCount: scController.scModel.results.length,
                          itemBuilder: (context, index) {
                            if (index ==
                                    scController.scModel.results.length - 1 &&
                                scController.is_ThereNext == true) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return ServiceCenterCard(
                              serviceCenter:
                                  scController.scModel.results[index],
                              pressedOn: () => scController.selectServiceCenter(
                                  scController.scModel.results[index].id),
                            );
                          },
                        ),
                      ),
                    if (scController.scModel.results.length == 0)
                      Text("results not found"),
                  ],
                ),
              ),
            AnimatedContainer(
              color: Colors.transparent,
              duration: Duration(milliseconds: 250),
              height: scController.containerheight,
              width: scController.containerWidth,
              margin: EdgeInsets.only(bottom: 2.0),
              // padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Card(
                elevation: 6,
                // margin: EdgeInsets.only(top: 1.0, bottom: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                          "${scController.scModel.total} Result for ${scController.searchWord} ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.0)),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        scController.cancelSearch();
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (!scController.response)
              NetWorkError(
                  buttonHandler: scController.retryGetingServiceCenters)
          ],
        );
      }),
    );
  }
}
