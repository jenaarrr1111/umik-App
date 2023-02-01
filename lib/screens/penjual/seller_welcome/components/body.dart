// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/size_config.dart';

// This is the best practice
// import '../components/seller_welcome_content.dart';
import '../../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(122)),
        child: Column(
          children: [
            Image.asset(
              'assets/images/splash_2.png',
              width: getProportionateScreenWidth(300),
              height: getProportionateScreenHeight(307),
            ),
            const Text(
              "Daftar sebagai penjual dengan",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "Melengkapi informasi yang",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "diperlukan",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
