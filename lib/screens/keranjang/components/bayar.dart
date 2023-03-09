import 'package:flutter/material.dart';

class Bayar extends StatelessWidget {
  final String namaProduk;
  final int harga;
  final int jmlhProduk;
  /* final int pajak;
  final int promo;
  final int totalHarga; */

  const Bayar({
    Key? key,
    required this.namaProduk,
    required this.harga,
    required this.jmlhProduk,
/*     required this.pajak,
    required this.promo,
    required this.totalHarga, */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Text(namaProduk,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child:
                  Text('Pajak', style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Text('Total Harga',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Rp 42.000',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Rp 8.500',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Rp 50.500',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
