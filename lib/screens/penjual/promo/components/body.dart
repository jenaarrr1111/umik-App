import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/promo/components/seller_promo_listview.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'dart:convert';
import 'package:umik/services/storage_service.dart';

class SellerPromo extends StatefulWidget {
  SellerPromo({super.key});

  @override
  State<SellerPromo> createState() => _SellerPromostate();
}

class _SellerPromostate extends State<SellerPromo> {
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
      var url = '$kApiBaseUrl/promo/umkm/$umkmId';
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
    return ListView.separated(
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _getUmkmWithCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return SellerPromoListView(
          namaMenu: _getUmkmWithCategories[index]['nama_produk'].toString(),
          thumbnail: _getUmkmWithCategories[index]['gbr_produk'].toString(),
          harga: _getUmkmWithCategories[index]['harga'].toString(),
          status: _getUmkmWithCategories[index]['status'].toString(),
          keterangan: _getUmkmWithCategories[index]['keterangan'].toString(),
        );
      },
      separatorBuilder: (_, int index) => const SizedBox(height: 8),
    );
  }
}
