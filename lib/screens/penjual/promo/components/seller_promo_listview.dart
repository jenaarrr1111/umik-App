import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/edit_produk/seller_edit_product.dart';

// ignore: must_be_immutable
class SellerPromoGridView extends StatefulWidget {
  final String namaMenu, thumbnail, harga, status, keterangan;

  const SellerPromoGridView({
    Key? key,
    required this.namaMenu,
    required this.thumbnail,
    required this.harga,
    required this.status,
    required this.keterangan,
  }) : super(key: key);

  @override
  State<SellerPromoGridView> createState() => _SellerMenuGridViewState();
}

class _SellerMenuGridViewState extends State<SellerPromoGridView> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(217, 217, 217, 217),
      child: Column(
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
                    Text(widget.status,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Color.fromARGB(255, 19, 110, 22))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 55),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Ulangi',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
              Align(
                child: IconButton(
                  iconSize: 15.0,
                  icon: isOn
                      ? const Icon(Icons.toggle_on_rounded,
                          color: kPrimaryColor)
                      : const Icon(Icons.arrow_forward_ios_rounded),
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
      ),
    );
  }
}
