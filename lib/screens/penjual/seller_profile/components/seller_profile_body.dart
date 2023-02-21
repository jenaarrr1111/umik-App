import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';

import '../../../../size_config.dart';
import '../../home/home_screen.dart';
import '../nama/seller_nama_screen.dart';
import '../no_handphone/hp_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class SellerProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Profile Kamu",
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

          SizedBox(height: 50),
          ProfileMenu3(
            text: "Lihat Toko Saya",
            press: () => {
              Navigator.pushNamed(context, SellerHomeScreen.routeName),
            },
          ),
          ProfileMenu3(
            text: "Rekap Penjualan",
            press: () => {},
          ),
        ],
      ),
    );
  }
}
