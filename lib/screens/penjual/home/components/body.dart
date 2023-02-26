import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:umik/screens/penjual/home/components/seller_menu_gridview.dart';
import 'package:umik/services/storage_service.dart';
import 'package:http/http.dart' as http;

class SellerBody extends StatefulWidget {
  const SellerBody({super.key});

  @override
  State<SellerBody> createState() => _SellerBodyState();
}

class _SellerBodyState extends State<SellerBody> {
  List _productsOnUmkm = [];
  final storage = StorageService();
  // utk sementara id umkmnya kyk gini

  Future<void> getUserTokenAndGetData() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      _getData(1.toString(), token);
    } catch (e) {
      print(e);
    }
  }

  Future _getData(String id, String token) async {
    try {
      var url = 'http://umik.test/api/products/umkm/1';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(response.statusCode);
        print(data);
        print(token);
        // print(data['data']);
        setState(() {
          _productsOnUmkm = data;
          // imgPath = 'assets/images/bakmie_ayam_madu.png';
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
    return ListView(
      scrollDirection: Axis.vertical,
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      children: [
        Row(
          children: [
            Text('Bakmie Hokki, Soehat',
                style: Theme.of(context).textTheme.headlineLarge),
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
        const SizedBox(height: 3),
        Text(
          'Jajanan',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          addAutomaticKeepAlives: false,
          itemCount: _productsOnUmkm.length,
          itemBuilder: (context, index) {
            return SellerMenuGridView(
              namaMenu: _productsOnUmkm[index]['nama_produk'].toString(),
              thumbnail: 'assets/images/bakmie_ayam_madu.png',
              harga: _productsOnUmkm[index]['harga'].toString(),
              keterangan: _productsOnUmkm[index]['deskripsi'].toString(),
            );
          },
        ),
      ],
    );
  }

  jsonDecode(String body) {}
}
