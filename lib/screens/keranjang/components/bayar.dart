import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class Bayar extends StatelessWidget {
  final String namaProduk;
  final int? harga;
  final int? jmlhProduk;
  // final int? potonganPromo;
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
    if (harga == null || jmlhProduk == null) {
      return const Text('Maaf terjadi kesalahan');
    }

    final int jmlh = jmlhProduk as int;
    print('jmlh: $jmlh');
    final int subtotal = harga! * jmlh;
    final int pajak = subtotal * 0.20 as int;
    final int totHarga = subtotal + pajak;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TODO: buat jadi row > (text, expand), row > text, expand
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('${jmlhProduk}x $namaProduk',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              /* if (potonganPromo != 0) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text('Promo',
                      style: Theme.of(context).textTheme.bodySmall),
                )
              ], */
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child:
                    Text('Pajak', style: Theme.of(context).textTheme.bodySmall),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Total Harga',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
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
                child: Text(fmtHarga.format(subtotal),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              /* if (potonganPromo != 0) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text(fmtHarga.format(potonganPromo),
                      style: Theme.of(context).textTheme.bodySmall),
                )
              ], */
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(fmtHarga.format(pajak),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(fmtHarga.format(totHarga),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
