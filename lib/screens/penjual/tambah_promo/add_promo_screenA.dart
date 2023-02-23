import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/tambah_promo/components/body.dart';
import 'package:umik/screens/penjual/tambah_promo/components/seller_promo_button.dart';

class SellerAddPromoScreen extends StatelessWidget {
  const SellerAddPromoScreen({super.key});

  static String routeName = "/add_promo";

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
