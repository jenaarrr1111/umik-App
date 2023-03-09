import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';

// ignore: must_be_immutable
class SellerPromoGridView extends StatefulWidget {
  final String gambar;

  const SellerPromoGridView({
    super.key,
    required this.gambar,
  });

  @override
  State<SellerPromoGridView> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<SellerPromoGridView> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 50,
          semanticContainer: true,
          // Implement InkResponse
          child: InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            onTap: () {
              // Clear all showing snack bars
              ScaffoldMessenger.of(context).clearSnackBars();
              // Display a snack bar
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(" "),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LimitedBox(
                maxWidth: 90.0,
                maxHeight: 90.0,
                child: FadeInImage(
                  image: NetworkImage('$kPublicStorage/${widget.gambar}'),
                  placeholder: const AssetImage(''),
                  // ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
