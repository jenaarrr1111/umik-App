import 'package:flutter/material.dart';
import 'package:umik/components/rectangle_bottom_first.dart';
import 'package:umik/components/rectangle_bottom_second.dart';
import 'package:umik/screens/penjual/seller_sign_up/seller_sign_up_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/components/body.dart';
import 'package:umik/size_config.dart';

import '../../../components/default_button.dart';

class SellerWelcomeScreen extends StatelessWidget {
  static String routeName = "/seller_welcome";

  const SellerWelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Selamat Datang ke UMIK",
            style: TextStyle(color: Colors.black),
          ),
          shadowColor: Colors.black45,
          elevation: 20,
        ),
        body: const Body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(18),
            right: getProportionateScreenWidth(18),
            bottom: getProportionateScreenHeight(23),
          ),
          child: RectangleFirst(
              text: "Mulai Pendafaran",
              press: () {
                Navigator.pushNamed(context, SellerSignUpScreen.routeName);
              }),
        ));
  }
}
