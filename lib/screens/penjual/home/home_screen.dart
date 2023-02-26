import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/home/components/body.dart';
import 'package:umik/screens/penjual/home/components/seller_bottom_navbar.dart';
import 'package:umik/screens/penjual/home/components/seller_fab.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});

  static String routeName = "/seller_home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: const SellerBody(),
      floatingActionButton: const SellerFAB(),
      bottomNavigationBar: const SellerBottomNavbar(),
    );
  }
}
