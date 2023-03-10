import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/tambah_promo/components/body.dart';
import 'package:umik/screens/penjual/tambah_promo/components/seller_promo_button.dart';
import 'dart:convert';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

class SellerAddPromoScreen extends StatelessWidget {
  final Map? arguments;

  const SellerAddPromoScreen({super.key, required this.arguments});
  static String routeName = "/add_promo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Promo'),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: SellerPromo(arguments: arguments),
      bottomNavigationBar: const PromoButton(),
    );
  }
}
