import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/pilih_menu/components/search_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/tambah_promo/add_promo_screen.dart';
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
  String produkid = '';

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
              String namaMenu = _getUmkmWithCategories[index]!['nama_produk'];
              String thumbnail =
                  _getUmkmWithCategories[index]!['gbr_produk'] ?? '';
              String harga =
                  fmtHarga.format(_getUmkmWithCategories[index]!['harga']);
              int idProduk = _getUmkmWithCategories[index]!['id'] ?? 0;

              return GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 110.0,
                            height: 100.0,
                            child: FadeInImage(
                              image:
                                  NetworkImage('$kPublicStorage/${thumbnail}'),
                              placeholder: const AssetImage(''),
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15, // <-- SEE HERE
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                namaMenu,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                height: 9, // <-- SEE HERE
                              ),
                              Text(harga,
                                  textAlign: TextAlign.left,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              SizedBox(
                                height: 9, // <-- SEE HERE
                              ),
                            ],
                          ),
                        ),
                        Align(
                          child: IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SellerAddPromoScreen.routeName,
                                  arguments: {
                                    'idProduk': idProduk.toString(),
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) => const Divider(),
          ),
        ),
      ],
    );
  }
}
