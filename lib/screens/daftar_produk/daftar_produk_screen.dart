import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DaftarProdukScreen extends StatelessWidget {
  const DaftarProdukScreen({super.key});
  static String routeName = '/daftar_produk';

  @override
  Widget build(BuildContext context) {
    // Ekstrak argumen
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final String namaUmkm = args.isNotEmpty ? args['namaUmkm'] : 'Tes UMKM';
    final String kategoriUmkm =
        args.isNotEmpty ? args['kategori'] : 'Tes kategori1, kategori2';
    final idUmkm = args.isNotEmpty ? args['idUmkm'] : 1;
    print('id: $idUmkm');

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
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Text(namaUmkm, style: Theme.of(context).textTheme.titleLarge),
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
          Text(kategoriUmkm,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12)),
          const SizedBox(height: 15),
          Text(
            'Recomended',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, index) {
              return const GridItemDaftarProduk();
            },
          ),
        ],
      ),
    );
  }
}

class GridItemDaftarProduk extends StatefulWidget {
  const GridItemDaftarProduk({super.key});

  @override
  State<GridItemDaftarProduk> createState() => _GridItemDaftarProdukState();
}

class _GridItemDaftarProdukState extends State<GridItemDaftarProduk> {
  List _getProductsOnUmkm = [];

  Future _getData() async {
    try {
      const url = 'http://umik.test/api/products/umkm/1';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 1|bPA2HqmNWTMnjQtz5XVwuYRVLgWCDbzzAstCMe98',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _getProductsOnUmkm = data;
        });
        print(data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Text('soaseu'),
    );
  }
}
