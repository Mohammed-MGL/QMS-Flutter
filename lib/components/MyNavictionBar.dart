import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qms/Controllers/FavoriteController.dart';
import 'package:qms/Controllers/ReservationController.dart';
import 'package:qms/pages/FavoritePage.dart';
import 'package:qms/pages/HistoryPage.dart';
import 'package:qms/pages/Profile.dart';
import 'package:qms/pages/ServiceCentersPage.dart';
import 'package:qms/pages/ReservationPage.dart';


class MyNavictionBar extends StatelessWidget {
  final int selectedItem;
  const MyNavictionBar({
    Key key,
    @required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: selectedItem,
      onTap: (index) {
        switch (index) {
          case 0:
            {
              Get.offAll(() => ServiceCentersPage(),transition: Transition.noTransition);
            }
            break;

          case 1:
            {
               Get.find<FavoriteController>().getFavList();
              Get.offAll(() => FavoritePage(),transition: Transition.noTransition);
            }
            break;
          case 2:
            {
              Get.offAll(() => ReservationPage(),transition: Transition.noTransition);
            }
            break;
          case 3:
            {
              Get.offAll(() => HistoryPage(),transition: Transition.noTransition);
            }
            break;

          case 4:
            {
              Get.offAll(() => ProfileUser(),transition: Transition.noTransition);
            }
            break;
        }
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
          icon: Icon(Icons.supervisor_account_rounded ),
        ),
        BottomNavigationBarItem(
          label: ('History'),
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
