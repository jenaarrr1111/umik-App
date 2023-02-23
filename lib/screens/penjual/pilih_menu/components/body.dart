import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/pilih_menu/components/search_field.dart';
import 'package:umik/screens/penjual/pilih_menu/components/seller_promo_listview.dart';

import '../../../../constants.dart';

class SellerPromo extends StatelessWidget {
  SellerPromo({super.key});
  final List<Map<String, dynamic>> dataProduk = [
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'aktif',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_suwir.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'aktif',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'selesai',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            child: const SearchField(),
          ),
        ),
        Flexible(
          flex: 10,
          fit: FlexFit.tight,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: dataProduk.length,
            itemBuilder: (BuildContext context, int index) {
              return SellerPromoGridView(
                namaMenu: dataProduk[index]['nama_menu'].toString(),
                thumbnail: dataProduk[index]['thumbnail'].toString(),
                harga: dataProduk[index]['harga'].toString(),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ],
    );
  }
}
