import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/promo/components/seller_promo_listview.dart';

import '../../../../constants.dart';

class SellerPromo extends StatelessWidget {
  SellerPromo({super.key});
  final List<Map<String, dynamic>> dataProduk = [
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'aktif',
    },
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'selesai',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dataProduk.length,
      itemBuilder: (BuildContext context, int index) {
        return SellerPromoGridView(
          namaMenu: dataProduk[index]['nama_menu'].toString(),
          thumbnail: dataProduk[index]['thumbnail'].toString(),
          harga: dataProduk[index]['harga'].toString(),
          status: dataProduk[index]['status'].toString(),
          keterangan: dataProduk[index]['keterangan'].toString(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
