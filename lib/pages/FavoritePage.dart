import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ServiceCentersController.dart';
import 'package:qms/components/MyNavictionBar.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   Get.find<HistoryController>().getHistory();

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
          ' My Favorite '.tr,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DancingScript',
            fontSize: 35,
          ),
        ),
      ),
      body:ListView.builder(
           itemCount: 2,
          itemBuilder: (context, i) {
            var test = [
              " MTN",
              "Syriatel",
             
            ];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.favorite,color: Theme.of(context).accentColor,),
                    title: Text(test[i]),
                   
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('View details',
                     
                      style: TextStyle(color: Theme.of(context).accentColor,),
                      
                    ),
                  ),
                ],
              ),
            );
            
          } ),
          
    );
  }
}
