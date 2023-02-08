import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class SellerMenuGridView extends StatefulWidget {
  final String namaMenu, thumbnail, harga;

  const SellerMenuGridView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
  }) : super(key: key);

  @override
  State<SellerMenuGridView> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<SellerMenuGridView> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                offset: const Offset(0, 30),
                // Return PopupMenuEntry with String as value
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Hapus',
                    child: Text('Hapus'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.namaMenu,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.harga,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: const EdgeInsets.only(right: 10),
            iconSize: 45.0,
            alignment: const Alignment(-1, 1),
            icon: isOn
                ? const Icon(Icons.toggle_on_rounded, color: kPrimaryColor)
                : const Icon(Icons.toggle_off_rounded),
            onPressed: () {
              setState(() {
                isOn = !isOn;
              });
            },
          ),
        )
      ],
    );
  }
}
