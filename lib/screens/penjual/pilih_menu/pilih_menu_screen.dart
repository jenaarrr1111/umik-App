import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/pilih_menu/components/body.dart';
import 'package:umik/screens/penjual/pilih_menu/components/seller_promo_button.dart';

class SellerPilihMenuScreen extends StatelessWidget {
  const SellerPilihMenuScreen({super.key});

  static String routeName = "/pilih_menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Menu'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(),
      bottomNavigationBar: const PromoButton(),
    );
  }
}
