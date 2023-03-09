import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/tambah_promo/add_promo_screenA.dart';

// ignore: must_be_immutable
class SellerPromoGridView extends StatefulWidget {
  final String namaMenu, thumbnail, harga;

  const SellerPromoGridView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
  }) : super(key: key);

  @override
  State<SellerPromoGridView> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<SellerPromoGridView> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 110.0,
                height: 100.0,
                child: FadeInImage(
                  image: NetworkImage('$kPublicStorage/${widget.thumbnail}'),
                  placeholder: const AssetImage(''),
                  // ),
                ),
              ),
            ),
            SizedBox(
              width: 15, // <-- SEE HERE
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.namaMenu,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 9, // <-- SEE HERE
                  ),
                  Text(widget.harga,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(
                    height: 9, // <-- SEE HERE
                  ),
                ],
              ),
            ),
            Align(
              child: IconButton(
                iconSize: 20,
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () => {
                  Navigator.pushNamed(context, SellerAddPromoScreen.routeName),
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
