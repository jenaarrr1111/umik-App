import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/services/storage_service.dart';

// Target
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
  String _idUmkm = '';
  String? _namaUmkm;
  String? _kategori;
  String _token = '';
  List _productsOnUmkm = [];
  final storage = StorageService();

  Future _getIdNamaUmkmToken() async {
    _idUmkm = await storage.readSecureData('id_umkm') ?? '';
    print(_idUmkm);
    _namaUmkm = await storage.readSecureData('nama_umkm');
    _token = await storage.readSecureData('token') ?? '';
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
          _kategori = res['kategori'] ?? 'kategori1, kategori2';
          print('products: $_productsOnUmkm');
          print('katgeri: $_kategori');
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
    // Ekstrak argumen
    // final args = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    // final int idUmkm = args.isNotEmpty ? args['idUmkm'] : 0;
    // // Buat req
    _getProductsOnUmkm(_idUmkm, _token);
    print('idUmkm: $_idUmkm, $_token');

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
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  _kategori ?? 'Kategori1, kategori2',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Recomended',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          // GridItemDaftarProduk(idUmkm: _idUmkm),
          AlignedGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            addAutomaticKeepAlives: false,
            itemCount: _productsOnUmkm.length,
            itemBuilder: (context, index) {
              String namaProduk =
                  _productsOnUmkm[index]!['nama_produk'] ?? 'Nama Menu';
              String deskripsi =
                  _productsOnUmkm[index]!['deskripsi'] ?? 'deskripsi';
              String harga = fmtHarga.format(_productsOnUmkm[index]!['harga']);

              return ProdukAsGridItem(
                namaProduk: namaProduk,
                deskripsi: deskripsi,
                harga: harga,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProdukAsGridItem extends StatelessWidget {
  final String namaProduk;
  final String deskripsi;
  final String harga;
  const ProdukAsGridItem({
    super.key,
    required this.namaProduk,
    required this.deskripsi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
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
                      child: Image.asset(
                        'assets/images/bakmie_ayam_suwir.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(namaProduk, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              deskripsi.isNotEmpty // render keterangan klo ada
                  ? Text(deskripsi,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: kTextSecondColor))
                  : const SizedBox(), // render sizedbox kosong, biar ga makan tempat kosong
              const SizedBox(height: 5),
              Text(harga, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 15),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => {},
              child: Text(
                'Tambah',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Kelas 2
// terima nama produk, deskripsi, harga
/* class GridItemDaftarProduk extends StatefulWidget {
  const GridItemDaftarProduk({super.key});

  @override
  State<GridItemDaftarProduk> createState() => _GridItemDaftarProdukState();
}

class _GridItemDaftarProdukState extends State<GridItemDaftarProduk> {
  List _productsOnUmkm = [];
  final storage = StorageService();

  Future<void> getUserTokenAndGetData() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      _getData(widget.idUmkm.toString(), token);
    } catch (e) {
      print(e);
    }
  }

  Future _getData(String id, String token) async {
    try {
      var url = '$kApiBaseUrl/products/umkm/$id';
      print(url);
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
          _productsOnUmkm = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserTokenAndGetData();
    // _getData(widget.idUmkm.toString());
  }

  @override
  Widget build(BuildContext context) {
    // Handle error klo ngga ada idUmkm nya
    if (widget.idUmkm == 0) {
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
      itemCount: _productsOnUmkm.length,
      itemBuilder: (context, index) {
        String namaProduk = _productsOnUmkm[index]!['nama_produk'];
        String deskripsi = _productsOnUmkm[index]!['deskripsi'] ?? '';
        String harga = fmtHarga.format(_productsOnUmkm[index]!['harga']);

        return GestureDetector(
          onTap: () {},
          child: Column(
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
                          child: Image.asset(
                            'assets/images/bakmie_ayam_suwir.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(namaProduk,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 5),
                  deskripsi.isNotEmpty // render keterangan klo ada
                      ? Text(deskripsi,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: kTextSecondColor))
                      : const SizedBox(), // render sizedbox kosong, biar ga makan tempat kosong
                  const SizedBox(height: 5),
                  Text(harga, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 15),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Tambah',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} */

/* class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: Colors.pink,
      height: extent,
      child: const Text('saoeuhsaoe'),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
} */
