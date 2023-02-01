import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/seller_address/components/body.dart';
import 'package:umik/size_config.dart';

import '../../../components/default_button.dart';
import '../../../components/second_button.dart';
import '../seller_sign_up/seller_sign_up_screen.dart';

class SellerAddressScreen extends StatelessWidget {
  static String routeName = "/seller_address";

  const SellerAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Alamat Baru",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(18),
            right: getProportionateScreenWidth(18),
            bottom: getProportionateScreenHeight(23),
          ),
          child: DefaultButton(
              text: "Lanjut",
              press: () {
                Navigator.pushNamed(context, SellerSignUpScreen.routeName);
              }),
        ));
  }
}
