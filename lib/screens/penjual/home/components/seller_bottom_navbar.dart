import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class SellerBottomNavbar extends StatelessWidget {
  const SellerBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFDADADA),
      selectedItemColor: kPrimaryColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          // Icon dari figma di export ke svg
          icon: Icon(Icons.person_rounded),
          // icon: Image.asset('assets/icons/person_icon.svg'),
          label: 'Saya',
        ),
      ],
    );
  }
}
