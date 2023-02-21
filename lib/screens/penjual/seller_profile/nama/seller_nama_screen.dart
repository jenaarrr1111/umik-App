import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
// import 'package:umik/screens/profile/components/nama/components/body.dart';

import '../../../../components/custom_profile.dart';
import '../seller_profile_screen.dart';

class SellerNamaScreen extends StatelessWidget {
  static String routeName = "/seller_profile_nama";

  const SellerNamaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Nama",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, SellerProfileScreen.routeName),
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Color(0xFF33691E),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomProfile(
                    label: "Nama",
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Text(
                        "Maks. 30 karakter",
                        style: TextStyle(
                          color: kTextSecondColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
