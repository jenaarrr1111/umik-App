import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/home/components/seller_menu_gridview.dart';

class SellerBody extends StatelessWidget {
  SellerBody({super.key});

  final List<Map<String, dynamic>> dataProduk = [
      {
        'nama_menu': 'Bakmie Ayam Madu',
        'thumbnail': 'assets/images/bakmie_ayam_madu.png',
        'harga': 19000,
      },
      {
        'nama_menu': 'Bakmie Ayam Suwir',
        'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Pangsit Kukus',
        'thumbnail': 'assets/images/pangsit_kukus.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Pangsit Kukus',
        'thumbnail': 'assets/images/pangsit_kukus.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Bakmie Ayam Suwir',
        'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Pangsit Kukus',
        'thumbnail': 'assets/images/pangsit_kukus.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Bakmie Ayam Suwir',
        'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
        'harga': 15000,
      },
      {
        'nama_menu': 'Bakmie Ayam Madu',
        'thumbnail': 'assets/images/bakmie_ayam_madu.png',
        'harga': 19000,
      },
      {
        'nama_menu': 'Bakmie Ayam Suwir',
        'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
        'harga': 15000,
      },
];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      children: [
        Row(
          children: const [
            Text( 
              'Bakmie Hokki, Soehat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 3.0),
              child: Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
            ),
            Text( // Rating UMKM
              '4.8',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Text(
          "Jajanan",
          style: TextStyle(
            fontSize: 15,
            color: kTextSecondColor,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Recomended',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ), 
            itemCount: dataProduk.length,
            itemBuilder: (_, index) {
              return SellerMenuGridView(
                namaMenu: dataProduk[index]['nama_menu'].toString(),
                thumbnail: dataProduk[index]['thumbnail'].toString(),
                harga: dataProduk[index]['harga'].toString(),
              );
            }
          ),
        )
      ],

    );
  }
}
