import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';
import 'package:umik/screens/penjual/home/components/seller_bottom_navbar.dart';
import 'package:umik/screens/penjual/home/components/seller_fab.dart';
import 'package:umik/services/storage_service.dart';

// read umkm_id dari storage
// buat req pake idumkm umkm utk ambil+oper nama, kategori
// Cuma perlu satu req
// Perlu namaumkm, kategori, data produk
class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  static String routeName = "/seller_home";

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  String? _umkmId;
  String? _namaUmkm;
  String? _kategori;
  String? _token;
  List _productsOnUmkm = [];
  final storage = StorageService();

  Future _getIdNamaUmkmToken() async {
    try {
      final String? umkmId = await storage.readSecureData('umkm_id');
      // print('auesaeua: $umkmId');
      final namaUmkm = await storage.readSecureData('nama_umkm');
      final token = await storage.readSecureData('token');
      setState(() {
        _umkmId = umkmId;
        _namaUmkm = namaUmkm;
        _token = token;
      });
      // set id umkm jadi 0, biar return 404
      _getProductsOnUmkm(_umkmId ?? '0', _token ?? '');
    } catch (e) {
      print(e);
    }
  }

  // Buat req
  Future _getProductsOnUmkm(String idUmkm, String token) async {
    try {
      var url = '$kApiBaseUrl/products/umkm/$idUmkm';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        setState(() {
          _productsOnUmkm = res['data'];
          _kategori = res['kategori'];
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
    _getIdNamaUmkmToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        children: [
          Row(
            children: [
              Flexible(
                child: Text(_namaUmkm ?? 'Nama Umkm',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              if (_productsOnUmkm.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 3.0),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                ),
                Text('4.8', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  _kategori ?? 'Belum ada kategori',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          renderAlignedGridView(),
        ],
      ),
      floatingActionButton: const SellerFAB(),
      bottomNavigationBar: const SellerBottomNavbar(),
    );
  }

  Widget renderAlignedGridView() {
    // Handle error klo ngga ada idUmkm nya
    if (_umkmId == '0') {
      return const Text(
        'Maaf terjadi kesalahan. Mohon coba beberapa saat lagi. (404)',
        textAlign: TextAlign.center,
      );
    }

    if (_productsOnUmkm.isEmpty) {
      return const Center(
        child: Text('Belum ada produk.', textAlign: TextAlign.center),
      );
    }

    return AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        addAutomaticKeepAlives: false,
        itemCount: _productsOnUmkm.length /* 12 */,
        itemBuilder: (context, index) {
          return ProdukAsGridItem(
            // tes
            // namaProduk: 'Nama Menu',
            // deskripsi: 'deskripsi',
            // harga: 'Rp 30.000',
            token: _token ?? '',
            idProduk: _productsOnUmkm[index]!['id'].toString(),
            namaProduk: _productsOnUmkm[index]!['nama_produk'] ?? 'Nama Menu',
            deskripsi: _productsOnUmkm[index]!['deskripsi'] ?? 'deskripsi',
            harga: fmtHarga.format(_productsOnUmkm[index]!['harga']),
            imagePath: _productsOnUmkm[index]['gbr_produk'] ?? '',
          );
        });
  }
}

class ProdukAsGridItem extends StatefulWidget {
  final String token;
  final String idProduk;
  final String namaProduk;
  final String deskripsi;
  final String harga;
  final String imagePath;
  const ProdukAsGridItem({
    super.key,
    required this.idProduk,
    required this.namaProduk,
    required this.deskripsi,
    required this.harga,
    required this.imagePath,
    required this.token,
  });

  @override
  State<ProdukAsGridItem> createState() => _ProdukAsGridItemState();
}

class _ProdukAsGridItemState extends State<ProdukAsGridItem> {
  bool isOn = false;

  Future _onDelete(String token, String id) async {
    try {
      var url = Uri.parse('$kApiBaseUrl/product/$id');
      await http.delete(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, SellerHomeScreen.routeName, (route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      image:
                          NetworkImage('$kPublicStorage/${widget.imagePath}'),
                      placeholder: const AssetImage(
                          'assets/images/bakmie_ayam_suwir.png'),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Edit') {
                        Navigator.pushNamed(
                            context, SellerEditProductScreen.routeName);
                      } else if (value == 'Hapus') {
                        _onDelete(widget.token, widget.idProduk);
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                    ),
                    padding: const EdgeInsets.all(0),
                    offset: const Offset(0, 30),
                    // Return PopupMenuEntry with String as value
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Edit',
                        child: Text('Edit',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                      PopupMenuItem<String>(
                        value: 'Hapus',
                        child: Text('Hapus',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.namaProduk,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            widget.deskripsi.isNotEmpty // render keterangan klo ada
                ? Text(widget.deskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kTextSecondColor))
                : const SizedBox(), // render sizedbox kosong, biar ga makan tempat kosong
            const SizedBox(height: 5),
            Text(widget.harga, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 15),
          ],
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: 40.0,
                alignment: Alignment.topRight,
                icon: isOn
                    ? const Icon(Icons.toggle_on_rounded, color: kPrimaryColor)
                    : const Icon(Icons.toggle_off_rounded),
                onPressed: () {
                  setState(() => isOn = !isOn);
                  // TODO: simpan status on atau off utk tiap produk
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
