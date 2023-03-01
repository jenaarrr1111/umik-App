import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/screens/profile/profile_screen.dart';

import '../../../../size_config.dart';
import '../../home/home_screen.dart';
import '../nama/seller_nama_screen.dart';
import '../no_handphone/hp_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class SellerProfileBody extends StatelessWidget {
  const SellerProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Profile Kamu",
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
              Navigator.pushNamed(context, SellerNamaScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Username",
            press: () {},
          ),
          ProfileMenu(
            text: "Handphone",
            press: () => {
              Navigator.pushNamed(context, SellerHpScreen.routeName),
            },
          ),
          ProfileMenu2(
            text: "Email",
            press: () {},
          ),

          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Lihat Toko Saya",
            press: () => {
              Navigator.pushNamed(context, SellerHomeScreen.routeName),
            },
          ),
          ProfileMenu3(
            text: "Rekap Penjualan",
            press: () => {
              // Navigator.pushNamed(context, SellerHomeScreen.routeName),
            },
          ),
          const SizedBox(height: 20),
          ProfileMenu3(
            text: "Beranda User",
            press: () => {Navigator.pushNamed(context, HomeScreen.routeName)},
          ),
        ],
      ),
    );
  }
}
