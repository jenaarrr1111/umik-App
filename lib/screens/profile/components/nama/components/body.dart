import 'package:flutter/material.dart';

import '../../../../../size_config.dart';
import 'nama_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          NamaForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          // Text(
          //   "Profile Saya",
          //   style: heading1Style,
          // ),

          // TextField(
          //   decoration: new InputDecoration(
          //     hintText: "masukan nama lengkap anda",
          //     // labelText: "Nama Lengkap",
          //     border: OutlineInputBorder(
          //         // borderRadius: new BorderRadius.circular(5.0),
          //         ),
          //   ),
          // ),
          // SizedBox(height: getProportionateScreenHeight(20)),
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
