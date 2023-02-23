import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/promo/components/body.dart';
import 'package:umik/screens/penjual/promo/components/seller_promo_button.dart';

import '../../../constants.dart';
import '../home/home_screen.dart';

class SellerPromoScreen extends StatelessWidget {
  const SellerPromoScreen({super.key});

  static String routeName = "/promo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo'),
        leading: IconButton(
          onPressed: () => {
            Navigator.pushNamed(context, SellerHomeScreen.routeName),
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(),
      bottomNavigationBar: const PromoButton(),
    );
  }
}
