import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';

import '../../../size_config.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Profile Saya",
            style: heading1Style,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          ProfilePic(),
          SizedBox(height: getProportionateScreenHeight(10)),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit Foto",
              style: TextStyle(
                // fontSize: getProportionateScreenWidth(15),
                color: kTextSecondColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Nama",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Username",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Handphone",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Email",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Mulai Sebagai Penjual",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, SellerWelcomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
