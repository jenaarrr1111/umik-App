import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/pilih_menu/components/search_field.dart';
import 'package:umik/screens/penjual/pilih_menu/components/seller_promo_listview.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'dart:convert';
import 'package:umik/services/storage_service.dart';

class MenuPromo extends StatefulWidget {
  const MenuPromo({super.key});
  // final int idUmkm;
  @override
  State<MenuPromo> createState() => _MenuPromoState();
}

class _MenuPromoState extends State<MenuPromo> {
  List _getUmkmWithCategories = [];
  final storage = StorageService();
  String umkmId = '';

  Future<void> getUserTokenAndGetData() async {
    try {
      final String umkmId = await storage.readSecureData('umkm_id') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      setState(() {
        this.umkmId = umkmId;
      });
      getData(umkmId, token);
    } catch (e) {
      print(e);
    }
  }

  Future getData(String umkmId, String token) async {
    try {
      var url = '$kApiBaseUrl/products/umkm/$umkmId';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _getUmkmWithCategories = data;
        });
      }
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserTokenAndGetData();
  }

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
            itemCount: _getUmkmWithCategories.length,
            itemBuilder: (BuildContext context, index) {
              return SellerPromoGridView(
                namaMenu: _getUmkmWithCategories[index]['nama_produk'] ?? '',
                thumbnail: _getUmkmWithCategories[index]['gbr_produk'] ?? '',
                harga: fmtHarga.format(_getUmkmWithCategories[index]!['harga']),
              );
            },
            separatorBuilder: (BuildContext context, index) => const Divider(),
          ),
        ),
      ],
    );
  }
}
