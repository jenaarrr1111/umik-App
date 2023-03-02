import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
// import 'package:umik/screens/profile/components/nama/components/body.dart';

import '../seller_profile_screen.dart';
import 'components/seller_nama_form.dart';

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
        shadowColor: Colors.black45,
        elevation: 20,
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
      body: SellerNamaFromScreen(),
    );
  }
}
