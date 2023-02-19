import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/buat_promo/components/body.dart';
import 'package:umik/screens/penjual/buat_promo/components/seller_promo_button.dart';

class SellerCreatePromoScreen extends StatelessWidget {
  const SellerCreatePromoScreen({super.key});

  static String routeName = "/create_promo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Promo'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(),
      bottomNavigationBar: const PromoButton(),
    );
  }
}
