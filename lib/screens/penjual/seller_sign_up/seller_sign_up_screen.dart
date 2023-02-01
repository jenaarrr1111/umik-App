import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/body.dart';
import 'package:umik/size_config.dart';

import '../../../components/default_button.dart';
import '../../../components/second_button.dart';

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
    );
  }
}
