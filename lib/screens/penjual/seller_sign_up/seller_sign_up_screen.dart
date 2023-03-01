import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/body.dart';

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
          shadowColor: Colors.black45,
          elevation: 20,
        ),
        body: const Body(),
      ),
    );
  }
}
