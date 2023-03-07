import 'package:umik/screens/struk/components/struk_card.dart';
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
      'total': '2x',
    },
  ];
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return StrukCard(
            namaMenu: dataProduk[index]['nama_menu'].toString(),
            thumbnail: dataProduk[index]['thumbnail'].toString(),
            harga: dataProduk[index]['harga'].toString(),
            total: dataProduk[index]['total'].toString(),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
