import 'package:flutter/material.dart';
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
        title: const Text("Selamat Datang ke UMIK"),
      ),
      body: const Body(),
      bottomNavigationBar:
          DefaultButton(text: "Mulai Pendafaran", press: () {}),
      //  Padding(
      // padding: EdgeInsets.only(
      //   left: getProportionateScreenWidth(18),
      //   right: getProportionateScreenWidth(18),
      //   bottom: getProportionateScreenHeight(31),
      // ),
      // child: TextButton(
      //   onPressed: () {},
      //   child: Text("Mulai Pendaftaran"),
      // ),
    );
  }
}
