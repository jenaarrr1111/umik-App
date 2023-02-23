import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/tambah_produk/seller_add_product.dart';

import '../../promo/promo_screen.dart';

class SellerFAB extends StatelessWidget {
  const SellerFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(right: 18),
      child: PopupMenuButton<String>(
        offset: const Offset(0, -130),
        color: Colors.white,
        icon: const Icon(Icons.add),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        // Return PopupMenuEntry with String as value
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Tambah Produk',
            child: Text(
              'Tambah Produk',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          PopupMenuItem<String>(
            value: 'Buat Promo',
            child: Text(
              'Buat Promo',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
        onSelected: (value) {
          if (value == 'Tambah Produk') {
            Navigator.pushNamed(context, SellerAddProductScreen.routeName);
            print(value);
          } else if (value == 'Buat Promo') {
            Navigator.pushNamed(context, SellerPromoScreen.routeName);
            print(value);
          }
        },
      ),
    );
  }
}
