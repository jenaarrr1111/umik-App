import 'package:umik/screens/penjual/tambah_promo/components/seller_promo_listview.dart';
import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class item_produk extends StatefulWidget {
  const item_produk({super.key});

  @override
  State<item_produk> createState() => _WidgetItemProdukStat();
}

class _WidgetItemProdukStat extends State<item_produk> {
  @override
  final List<Map<String, dynamic>> dataProduk = [
    {
      'nama_menu': 'Bakmie Ayam Madu',
      'thumbnail': 'assets/images/bakmie_ayam_madu.png',
      'harga': 'Rp. 19,000',
      'status': 'aktif',
    },
  ];
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SellerPromoGridView(
            namaMenu: dataProduk[index]['nama_menu'].toString(),
            thumbnail: dataProduk[index]['thumbnail'].toString(),
            harga: dataProduk[index]['harga'].toString(),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
