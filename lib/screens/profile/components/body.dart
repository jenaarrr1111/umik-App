import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/screens/profile/components/profile_menu.dart';
import 'package:umik/screens/profile/components/profile_pic.dart';
import 'package:umik/screens/profile/nama/nama_screen.dart';
import 'package:umik/screens/profile/no_handphone/hp_screen.dart';
import 'package:umik/screens/sign_out/sign_out.dart';
import 'package:umik/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Profile Saya",
            style: heading1Style,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          const ProfilePic(),
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
          const SizedBox(height: 20),
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
            press: () => {
              Navigator.pushNamed(context, HpScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Email",
            press: () {},
          ),
          ProfileMenu(
            text: "Mulai Sebagai Penjual",
            press: () => {
              Navigator.pushNamed(context, SellerWelcomeScreen.routeName),
            },
          ),
          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Logout",
            press: () => Navigator.pushNamedAndRemoveUntil(
                context, SignOut.routeName, (route) => false),
          ),
        ],
      ),
    );
  }
}
