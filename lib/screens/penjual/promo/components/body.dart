import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/promo/components/seller_promo_listview.dart';

class SellerPromo extends StatelessWidget {
  SellerPromo({super.key});
  final List<Map<String, dynamic>> dataProduk = [
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'Aktif',
    },
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'Selesai',
    },
    {
      'nama_menu': 'Menu Diskon',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': '15 Mei 2022 - 30 Mei 2022',
      'status': 'Selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'Aktif',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'Selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'Selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'Selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 19000,
      'status': 'Selesai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: dataProduk.length,
      itemBuilder: (BuildContext context, int index) {
        return SellerPromoListView(
          namaMenu: dataProduk[index]['nama_menu'].toString(),
          thumbnail: dataProduk[index]['thumbnail'].toString(),
          harga: dataProduk[index]['harga'].toString(),
          status: dataProduk[index]['status'].toString(),
          keterangan: dataProduk[index]['keterangan'].toString(),
        );
      },
      separatorBuilder: (_, int index) => const SizedBox(height: 8),
    );
  }
}
