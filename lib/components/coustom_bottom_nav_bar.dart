import 'package:flutter/material.dart';
import 'package:umik/enums.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_profile/seller_profile_screen.dart';
import 'package:umik/services/storage_service.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // initialize storage
  final StorageService storage = StorageService();
  String? lvlUser;

  Future _readLevelUser() async {
    try {
      final lvl = await storage.readSecureData('level_user');
      setState(() {
        lvlUser = lvl;
        print('$lvlUser, lvl: ${lvl.toString()}');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _readLevelUser();
  }

  @override
  Widget build(BuildContext context) {
    // const Color inActiveIconColor = Color.fromARGB(255, 0, 0, 0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
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
                onPressed: () {
                  if (lvlUser == 'penjual') {
                    Navigator.pushNamed(context, SellerProfileScreen.routeName);
                  }
                  Navigator.pushNamed(context, SellerProfileScreen.routeName);
                }),
            // Text("Saya"),
          ],
        ),
      ),
    );
  }
}
