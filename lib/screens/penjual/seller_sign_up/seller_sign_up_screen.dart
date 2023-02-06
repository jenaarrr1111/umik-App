import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:umik/components/rectangle_bottom_first.dart';
import 'package:umik/components/rectangle_bottom_second.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/body.dart';
import 'package:umik/size_config.dart';
import 'package:umik/theme.dart';

import '../../../components/rectangle_bottom_first.dart';
import '../../../components/rectangle_bottom_second.dart';
import '../seller_welcome/seller_welcome_screen.dart';

class SellerSignUpScreen extends StatelessWidget {
  static String routeName = "/seller_sign_up";

  const SellerSignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Atur Informasi UMKM",
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Atur Informasi UMKM",
                      style:
                          TextStyle(fontFamily: "Barlow", color: Colors.black)),
                ),
                Tab(
                  child: Text(
                    "Upload Produk",
                    style: TextStyle(fontFamily: "Barlow", color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: const Body(),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),
              bottom: getProportionateScreenHeight(10),
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: RectangleSecond(
                        text: "Kembali",
                        press: () {
                          Navigator.pushNamed(
                              context, SellerWelcomeScreen.routeName);
                        }),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: RectangleFirst(
                      text: "Kirim",
                      press: () {},
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
