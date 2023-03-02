import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/services/storage_service.dart';

// Awal
// Oper kategori, nama, id
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
  final storage = StorageService();

  Future _getData() async {
    try {
      var url = '$kApiBaseUrl/categories/${widget.kategori}';
      final response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
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
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if (_getUmkmWithCategories.isEmpty) {
      return const Text('Tidak ada toko.', textAlign: TextAlign.center);
    }

    return Column(
      children: _getUmkmWithCategories.isNotEmpty
          ? List.generate(
              _getUmkmWithCategories.length,
              (index) {
                int idUmkm = _getUmkmWithCategories[index]!['id_umkm'];
                String namaUmkm = _getUmkmWithCategories[index]!['nama_umkm'];
                String kategoriConcat =
                    _getUmkmWithCategories[index]!['kategori_concat'];
                kategoriConcat = kategoriConcat.split(',').join(', ');

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/daftar_produk', arguments: {
                      'idUmkm': idUmkm,
                      'namaUmkm': namaUmkm,
                      'kategori': kategoriConcat,
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          /* child: Container(
                            color: Colors.grey[100],
                            height: 100,
                            width: 100,
                          ), */
                          child: Image.asset('assets/images/cth_gbr_umkm.png'),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(namaUmkm,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(kategoriConcat,
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              const Divider(),
                              Text('Diantar dalam 25 menit - 1,5 km',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              /* Text('Diskon xxxxxx',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium), */
                            ],
                          ),
                        ),
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
