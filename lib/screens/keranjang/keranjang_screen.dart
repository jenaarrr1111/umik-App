import 'package:flutter/material.dart';
import 'package:umik/models/Cart.dart';

import 'components/body.dart';
// import 'components/check_out_card.dart';

class KeranjangScreen extends StatelessWidget {
  static String routeName = "/keranjang";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black45,
        elevation: 20,
      ),

      body: Body(),
      // bottomNavigationBar: CheckoutCard(),
    );
  }
}
