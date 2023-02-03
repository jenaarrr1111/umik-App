import 'package:flutter/material.dart';
import 'package:umik/screens/profile/components/nama/nama_screen.dart';

import '../../../../../size_config.dart';
import '../../profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // SizedBox(height: getProportionateScreenHeight(20)),
          // Text(
          //   "Profile Saya",
          //   style: heading1Style,
          // ),
          TextField(
            decoration: new InputDecoration(
              hintText: "masukan nama lengkap anda",
              // labelText: "Nama Lengkap",
              border: OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(5.0),
                  ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // SizedBox(height: 20),
          // ProfileMenu2(
          //   text: "Username",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
