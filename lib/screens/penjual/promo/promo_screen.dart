import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/promo/components/body.dart';
import 'package:umik/screens/penjual/promo/components/seller_promo_button.dart';

import '../../../constants.dart';

class SellerPromoScreen extends StatelessWidget {
  const SellerPromoScreen({super.key});

  static String routeName = "/promo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(),
      bottomNavigationBar: const PromoButton(),
    );
  }
}
