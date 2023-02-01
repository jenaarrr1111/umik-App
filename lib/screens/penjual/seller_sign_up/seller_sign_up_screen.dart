import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/body.dart';
import 'package:umik/size_config.dart';

import '../../../components/default_button.dart';
import '../../../components/second_button.dart';
import '../seller_welcome/seller_welcome_screen.dart';

class SellerSignUpScreen extends StatelessWidget {
  static String routeName = "/seller_sign_up";

  const SellerSignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Atur Informasi UMKM",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(18),
            right: getProportionateScreenWidth(18),
            bottom: getProportionateScreenHeight(23),
          ),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: SecondButton(
                      text: "Kembali",
                      press: () {
                        Navigator.pushNamed(
                            context, SellerWelcomeScreen.routeName);
                      }),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: DefaultButton(
                    text: "Kirim",
                    press: () {},
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
