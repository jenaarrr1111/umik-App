import 'package:flutter/material.dart';
import 'package:umik/models/Cart.dart';
import '/../../../constants.dart';
import '/../../../size_config.dart';

class StrukCard extends StatefulWidget {
  final String namaMenu, thumbnail, harga, total;

  const StrukCard({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
    required this.total,
  }) : super(key: key);

  @override
  State<StrukCard> createState() => _StrukCardGridViewState();
}

class _StrukCardGridViewState extends State<StrukCard> {
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
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(widget.harga,
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                      Text(widget.total,
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
