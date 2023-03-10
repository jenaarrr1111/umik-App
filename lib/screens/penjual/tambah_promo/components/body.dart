import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/tambah_promo/components/card_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'dart:convert';
import 'package:umik/services/storage_service.dart';

class SellerPromo extends StatefulWidget {
  final Map? arguments;
  const SellerPromo({super.key, required this.arguments});

  @override
  State<SellerPromo> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<SellerPromo> {
  final _formKey = GlobalKey<FormState>();
  String? _namaProduk;
  String? _imagePath;
  int? _harga;
  final storage = StorageService();
  String? produkId;
  dynamic args;

  String umkmId = '';
  void _setProdukId(String id) {
    produkId = id;
  }

  // Initialize form field controller
  var namaProdukController = TextEditingController();
  var deskripsiController = TextEditingController();
  var hargaController = TextEditingController();
  var stokController = TextEditingController();

  Future<void> getUserTokenAndGetData() async {
    try {
      final String umkmId = await storage.readSecureData('umkm_id') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      setState(() {
        this.umkmId = umkmId;
        this.umkmId = umkmId;
      });
      getData(produkId ?? '', token);
    } catch (e) {
      print(e);
    }
  }

  Future getData(String produkid, String token) async {
    try {
      var url = '$kApiBaseUrl/product/$produkid';
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
          _namaProduk = data['nama_produk'];
          _harga = data['harga'];
          _imagePath = data['gbr_produk'];
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
    _setProdukId(widget.arguments!['idProduk']);
    getUserTokenAndGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(shrinkWrap: true, children: <Widget>[
          Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 2.0,
                          color: Color.fromARGB(115, 158, 158, 158)),
                      bottom: BorderSide(
                          width: 4.0,
                          color: Color.fromARGB(115, 158, 158, 158)),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Tampilkan promo',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, bottom: 30, top: 20),
                          child: CardProduct(
                            hargaProduk: (_harga ?? 0),
                            namaProduk: _namaProduk ?? 'Nama Menu',
                            imagePath: _imagePath ?? '',
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // [ Nama Produk ]
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color(0xFFF5F6F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text('Harga sebelum diskon',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: namaProdukController,
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 0.5,
                              )),
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Rp Masukkan harga awal',
                          filled: true,
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),

                // [ Deskripsi Produk ]
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color(0xFFF5F6F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text('Persentase diskon',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: deskripsiController,
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 0.5,
                              )),
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Masukkan persentase',
                          filled: true,
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                // [ Harga Produk ]
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color(0xFFF5F6F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text('Harga setelah diskon',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: hargaController,
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 0.5,
                              )),
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Masukkan Harga setelah diskon',
                          filled: true,
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),

                // [ Stok Produk ]
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: const Color(0xFFF5F6F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text('Durasi promo',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Dari',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: stokController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                        borderSide: BorderSide(
                                          color: Colors.black38,
                                          width: 0.5,
                                        )),
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText: 'Dari',
                                    filled: true,
                                  ),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Hingga ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: stokController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                        borderSide: BorderSide(
                                          color: Colors.black38,
                                          width: 0.5,
                                        )),
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText: 'Hingga',
                                    filled: true,
                                  ),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
