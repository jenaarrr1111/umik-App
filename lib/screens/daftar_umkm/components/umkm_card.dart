import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UmkmCard extends StatefulWidget {
  final String kategori;

  const UmkmCard({
    super.key,
    required this.kategori,
  });

  @override
  State<UmkmCard> createState() => _UmkmCardState();
}

class _UmkmCardState extends State<UmkmCard> {
  List _getUmkmWithCategories = [];

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse('http://umik.test/api/categories/${widget.kategori}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _getUmkmWithCategories = data;
        });
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
    return Column(
      children: _getUmkmWithCategories.isNotEmpty
          ? List.generate(
              _getUmkmWithCategories.length,
              (index) {
                String idUmkm = _getUmkmWithCategories[index]!['id_umkm'];
                String namaUmkm = _getUmkmWithCategories[index]!['nama_umkm'];
                String kategori =
                    _getUmkmWithCategories[index]!['kategori_concat'];
                kategori = kategori.split(',').join(', ');

                return GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/daftar_produk', arguments: {
                      'idUmkm': idUmkm,
                      'namaUmkm': namaUmkm,
                      'kategori': kategori,
                    })
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(namaUmkm,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(kategori,
                            style: Theme.of(context).textTheme.labelSmall),
                        const Divider(),
                        Text('Diantar dalam 25 menit - 1,5 km',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('Diskon xxxxxx',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                );
              },
            )
          : [const Text('Tidak ada toko.')],
    );
  }
}
