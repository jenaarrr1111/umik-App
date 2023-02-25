import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';

// ignore: must_be_immutable
class SellerMenuGridView extends StatefulWidget {
  final String namaMenu, thumbnail, harga, keterangan;

  const SellerMenuGridView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
    required this.keterangan,
  }) : super(key: key);

  @override
  State<SellerMenuGridView> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<SellerMenuGridView> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.thumbnail,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Edit') {
                        Navigator.pushNamed(
                            context, SellerEditProductScreen.routeName);
                      } else if (value == 'Hapus') {
                        print(context);
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                    ),
                    padding: const EdgeInsets.all(0),
                    offset: const Offset(0, 30),
                    // Return PopupMenuEntry with String as value
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Edit',
                        child: Text('Edit',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                      PopupMenuItem<String>(
                        value: 'Hapus',
                        child: Text('Hapus',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.namaMenu,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            widget.keterangan != 'null' // render keterangan klo ada
                ? Text(widget.keterangan,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kTextSecondColor))
                : const SizedBox(), // render sizedbox kosong, biar ga makan tempat kosong
            const SizedBox(height: 5),
            Text(widget.harga, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: 40.0,
                alignment: Alignment.topRight,
                icon: isOn
                    ? const Icon(Icons.toggle_on_rounded, color: kPrimaryColor)
                    : const Icon(Icons.toggle_off_rounded),
                onPressed: () {
                  setState(() => isOn = !isOn);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
