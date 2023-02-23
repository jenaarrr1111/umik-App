import 'package:flutter/material.dart';
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
      'keterangan': 'Isi 3',
      'harga': 15000,
    },
    {
      'nama_menu': 'Pangsit Kukus',
      'thumbnail': 'assets/images/pangsit_kukus.png',
      'keterangan': 'Isi 3',
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
      'keterangan': 'Isi 3',
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
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      children: [
        Row(
          children: [
            Text('Bakmie Hokki, Soehat',
                style: Theme.of(context).textTheme.headlineLarge),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 3.0),
              child: Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
            ),
            Text('4.8', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          'Jajanan',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        GridView.builder(
            addAutomaticKeepAlives: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemCount: dataProduk.length,
            itemBuilder: (_, int index) {
              return SellerMenuGridView(
                namaMenu: dataProduk[index]['nama_menu'].toString(),
                thumbnail: dataProduk[index]['thumbnail'].toString(),
                harga: dataProduk[index]['harga'].toString(),
                keterangan: dataProduk[index]['keterangan'].toString(),
              );
            }),
      ],
    );
  }
}
