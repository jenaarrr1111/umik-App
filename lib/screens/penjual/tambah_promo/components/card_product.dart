import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

// ignore: must_be_immutable
class CardProduct extends StatefulWidget {
  final int hargaProduk;
  final String namaProduk;
  final String imagePath;
  const CardProduct({
    Key? key,
    required this.namaProduk,
    required this.imagePath,
    required this.hargaProduk,
  }) : super(key: key);

  @override
  State<CardProduct> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<CardProduct> {
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
                  image: NetworkImage('$kPublicStorage/${(widget.imagePath)}'),
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
                    widget.namaProduk,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text((widget.hargaProduk).toString(),
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
