import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_field.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/body.dart';
import 'package:umik/size_config.dart';

import '../../../components/default_button.dart';
import '../../../components/second_button.dart';
import '../seller_sign_up/seller_sign_up_screen.dart';

class SellerEmailScreen extends StatelessWidget {
  static String routeName = "/seller_email";

  const SellerEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Alamat Email",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Mohon Masukkan alamat Email untuk mendapatkan kode verifikasi(OTP)",
                    style: TextStyle(fontSize: 16),
                  ),
                  CustomTextField(label: "Email")
                ],
              ),
            ),
          ),
        )),
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
