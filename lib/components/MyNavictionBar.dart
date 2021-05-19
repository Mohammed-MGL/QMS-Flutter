import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/ReservationController.dart';

class MyNavictionBar extends StatelessWidget {
  final int selectedItem ;
  const MyNavictionBar({
    Key key, @required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue[700],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: selectedItem,
      onTap: (index) {
        
        Get.offAllNamed("page$index");
      },
      items: [
        BottomNavigationBarItem(
          label: ('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: ('Favorite'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: ('My Q'),
          icon: Icon(Icons.self_improvement_rounded),
        ),
        BottomNavigationBarItem(
          label: ('My H'),
          icon: Icon(Icons.query_builder),
        ),
        
        BottomNavigationBarItem(
          label: ('Profile'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
