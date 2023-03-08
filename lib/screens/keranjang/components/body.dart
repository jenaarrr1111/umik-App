import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/screens/keranjang/components/alamat.dart';
import 'package:umik/screens/keranjang/components/bayar_form.dart';
import 'package:umik/screens/rute/rute.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

import 'bayar.dart';
import 'card_produk.dart';

/* perlu: - id produk
          - id user
          - promo id
          - lokasi user
   tugas: - buat req utk ambil detail produk [x]
          - buat req buat pesanan [ ]
*/
class Body extends StatefulWidget {
  // cara lain utk passing argument
  // https://stackoverflow.com/questions/56262655/flutter-get-passed-arguments-from-navigator-in-widgets-states-initstate/63691154#63691154/
  final Map? arguments;
  const Body({super.key, required this.arguments});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // initialize storage
  final StorageService storage = StorageService();

  String? produkId;
  String? userToken;
  String? userId;
  dynamic args;

  String? _namaProduk;
  String? _imagePath;
  int? _harga;
  int? _stok; // TODO: tampilin stok

  // Utk buat pesanan
  int? _jmlhProduk;
  int? _subTotal;
  int? _pajak;
  int? _promo;
  int? _totalHarga;

  void _setProdukId(String id) {
    produkId = id;
  }

  Future _readUserIdAndToken() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      final String usrId = await storage.readSecureData('user_id') ?? '';
      setState(() {
        userToken = token;
        userId = usrId;
      });
      _getDataProduk(produkId ?? '');
    } catch (e) {
      print(e);
    }
  }

  /* === API CALLS ===*/
  Future _getDataProduk(String idProduk) async {
    try {
      var url = Uri.parse('$kApiBaseUrl/product/$idProduk');
      return await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      ).then((value) {
        final data = jsonDecode(value.body)['data'];
        print(data);
        if (value.statusCode == 200) {
          setState(() {
            _namaProduk = data['nama_produk'];
            _harga = data['harga'];
            _stok = data['stok'];
            _imagePath = data['gbr_produk'];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future _addPesanan(String idProduk) async {
    try {
      var url = Uri.parse('$kApiBaseUrl/pesanan');

      return await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken',
      }, body: {
        'user_id': '',
        'produk_id': '',
        'promo_id': '',
        'alamat_pelanggan': '',
        'jmlh_pesanan': '',
        'catatan': '',
        'waktu_psn': '',
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    print('idproduk: ${widget.arguments!['idProduk']}');
    _setProdukId(widget.arguments!['idProduk']);
    _readUserIdAndToken();
  }

  @override
  Widget build(BuildContext context) {
    // Ekstrak argumen dari pushedNamed navigotor
    // Cara lain pass argumen
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    final String produkId = args.isNotEmpty ? args['idProduk'] : '';
    _setProdukId(produkId);

    /* === FORM === */
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Keranjang Kamu",
            style: heading1Style,
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          const Alamat(),
          SizedBox(height: getProportionateScreenHeight(20)),
          CardProduk(
            jmlProduk: _jmlhProduk ?? 1,
            stokProduk: _stok ?? 1, // stok nya brp ya enak e?
            hargaProduk: _harga ?? 0,
            namaProduk: _namaProduk ?? 'Nama Menu',
            imagePath: _imagePath ?? '',
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          // const Bayar(),
          const BayarForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: getProportionateScreenWidth(160),
            height: getProportionateScreenHeight(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                setState(() {});
                showDialog<String>(
                  context: context,
                  builder: (context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Konfirmasi Pemesanan',
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 15),
                          // const Bayar(),
                          Text('Apa Anda yakin ingin membuat pesanan',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Batal',
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Konfirmasi',
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // onPressed: () => {
              //   Navigator.pushNamed(context, UserRute.routeName),
              // },
              child: Text(
                'Order',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
