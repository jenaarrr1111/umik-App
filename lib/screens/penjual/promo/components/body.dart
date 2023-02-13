import 'package:flutter/material.dart';

class SellerPromo extends StatelessWidget {
  SellerPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Belum Ada Promo',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Buat promo pertamamu!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
