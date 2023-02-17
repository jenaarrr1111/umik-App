import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

// ignore: must_be_immutable
class SellerPromoGridView extends StatefulWidget {
  final String namaMenu, thumbnail, harga, keterangan;

  const SellerPromoGridView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
    required this.keterangan,
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
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 110.0,
                height: 100.0,
                child: Image.asset(
                  widget.thumbnail,
                  fit: BoxFit.contain,
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
                iconSize: 25.0,
                icon: isOn
                    ? const Icon(Icons.check_circle_rounded,
                        color: kPrimaryColor)
                    : const Icon(Icons.check_circle_rounded),
                onPressed: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
