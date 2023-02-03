import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../../size_config.dart';
import '../../penjual/seller_welcome/seller_welcome_screen.dart';
import 'nama/nama_screen.dart';
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
            press: () => {
              Navigator.pushNamed(context, NamaScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Username",
            press: () {},
          ),
          ProfileMenu(
            text: "Handphone",
            press: () {},
          ),
          ProfileMenu2(
            text: "Email",
            press: () {},
          ),
          ProfileMenu(
            text: "Mulai Sebagai Penjual",
            press: () {
              Navigator.pushNamed(context, SellerWelcomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
