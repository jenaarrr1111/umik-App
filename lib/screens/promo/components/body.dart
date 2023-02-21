import 'package:flutter/material.dart';
import 'package:umik/screens/promo/components/seller_promo_listview.dart';

import '../../../../constants.dart';

class SellerPromo extends StatelessWidget {
  SellerPromo({super.key});
  final List<Map<String, dynamic>> dataProduk = [
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
    {
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 80),
                      child: Text('Pasti ada promo',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Makan hemat dari resto favorit kamu',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120, childAspectRatio: 2 / 3.1),
                  itemCount: dataProduk.length,
                  itemBuilder: (_, index) {
                    return SellerPromoGridView(
                      thumbnail: dataProduk[index]['thumbnail'].toString(),
                    );
                  }),
            ),
          ],
        ));
  }
}
