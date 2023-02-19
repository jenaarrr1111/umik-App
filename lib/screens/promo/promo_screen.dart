import 'package:flutter/material.dart';
import 'package:umik/screens/promo/components/body.dart';

import '../../../constants.dart';

class SellerPromoScreenUser extends StatelessWidget {
  const SellerPromoScreenUser({super.key});

  static String routeName = "/promo_home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo untukmu'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(),
    );
  }
}
