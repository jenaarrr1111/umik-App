import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/tambah_produk/components/add_product_body.dart';

class SellerAddProductScreen extends StatelessWidget {
  const SellerAddProductScreen({super.key});

  static String routeName = '/seller_add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk', 
        ),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: ListView(
        children: const [
          AddProductBody(),
        ],
      )
    );
  }
}

