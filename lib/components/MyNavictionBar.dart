import 'package:flutter/material.dart';

class MyNavictionBar extends StatelessWidget {
  const MyNavictionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
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
          label: ('Profile'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
