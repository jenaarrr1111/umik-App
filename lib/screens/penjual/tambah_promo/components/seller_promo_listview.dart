import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

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
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 110.0,
                height: 100.0,
                child: Image.asset(
                  widget.thumbnail,
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(widget.harga,
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            Align(
              child: IconButton(
                iconSize: 25.0,
                icon: isOn
                    ? const Icon(Icons.check_circle_rounded,
                        color: kPrimaryColor)
                    : const Icon(Icons.check_circle_rounded,
                        color: kPrimaryColor),
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
