import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/edit_produk/components/edit_product_body.dart';

class SellerEditProductScreen extends StatelessWidget {
  const SellerEditProductScreen({super.key});

  static String routeName = '/seller_edit_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Produk',
        ),
        shadowColor: Colors.black45,
        elevation: 20,
      ),
      body: ListView(
        children: const [
          EditProductBody(),
        ],
      ),
    );
  }
}
