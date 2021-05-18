import 'package:flutter/material.dart';
import 'package:qms/components/MyNavictionBar.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Center(child: Text("Coming Soon...",style: TextStyle(fontSize: 25),)),
      bottomNavigationBar: MyNavictionBar(selectedItem: 1,),
      
    );
  }
}