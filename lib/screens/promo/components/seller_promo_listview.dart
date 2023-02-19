import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';

// ignore: must_be_immutable
class SellerPromoGridView extends StatefulWidget {
  final String thumbnail;

  const SellerPromoGridView({
    Key? key,
    required this.thumbnail,
  }) : super(key: key);

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
              child: SizedBox(
                width: 92.0,
                height: 64.0,
                child: Image.asset(
                  widget.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
