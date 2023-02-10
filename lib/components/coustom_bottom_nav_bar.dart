import 'package:flutter/material.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/profile/profile_screen.dart';

import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color.fromARGB(255, 0, 0, 0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(40),
        //   topRight: Radius.circular(40),
        // ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         padding: const EdgeInsets.only(bottom: 8),
            //       ),
            //     ],
            //   ),
            // ),

            //Icon button Pesanan Saya
            IconButton(
              icon: Image.asset(
                "assets/images/Nav List View.png",
                // color: MenuState.home == selectedMenu
                //     // ? kPrimaryColor
                //     // : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            // Text(
            //   "Pesanan Saya",
            // ),

            //Icon button Profile
            IconButton(
              icon: Image.asset(
                "assets/images/Nav Vector.png",
                // color: MenuState.profile == selectedMenu
                //     ? kPrimaryColor
                //     : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
            // Text("Saya"),
          ],
        ),
      ),
    );
  }
}
