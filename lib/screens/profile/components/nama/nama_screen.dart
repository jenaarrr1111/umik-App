import 'package:flutter/material.dart';
// import 'package:umik/screens/profile/components/nama/components/body.dart';

import 'components/body.dart';

class NamaScreen extends StatelessWidget {
  static String routeName = "/profile_nama";

  const NamaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Nama",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              "Simpan",
              style: TextStyle(
                color: Color(0xFF33691E),
              ),
            ),
            // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Body(),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //     left: getProportionateScreenWidth(18),
      //     right: getProportionateScreenWidth(18),
      //     bottom: getProportionateScreenHeight(23),
      //   ),
      //   child: DefaultButton(
      //       text: "Mulai Pendafaran",
      //       press: () {
      //         Navigator.pushNamed(context, SellerSignUpScreen.routeName);
      //       }),
      // ),
    );
  }
}
