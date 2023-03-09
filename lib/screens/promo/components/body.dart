import 'package:flutter/material.dart';
import 'package:umik/screens/promo/components/seller_promo_listview.dart';
import 'package:http/http.dart' as http;
import '../../../../constants.dart';
import 'dart:convert';
import 'package:umik/services/storage_service.dart';

class SellerPromo extends StatefulWidget {
  const SellerPromo({
    super.key,
  });

  @override
  State<SellerPromo> createState() => _SellerPromoCardstate();
}

class _SellerPromoCardstate extends State<SellerPromo> {
  List _getUmkmWithCategories = [];
  final storage = StorageService();

  Future<void> getUserTokenAndGetData() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      getData(token);
    } catch (e) {
      print(e);
    }
  }

  Future getData(String token) async {
    try {
      var url = '$kApiBaseUrl/allpromo';
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
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 15),
                  child: Column(
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
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120, childAspectRatio: 2.55 / 3.1),
                  itemCount: _getUmkmWithCategories.length,
                  itemBuilder: (_, index) {
                    return SellerPromoGridView(
                      gambar: _getUmkmWithCategories[index]['gbr_produk'] ?? '',
                    );
                  }),
            ),
          ],
        ));
  }
}
