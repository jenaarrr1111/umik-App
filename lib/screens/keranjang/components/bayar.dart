import 'package:flutter/material.dart';

class Bayar extends StatelessWidget {
  const Bayar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Promo',
                    style: Theme.of(context).textTheme.labelSmall),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Pajak',
                    style: Theme.of(context).textTheme.labelSmall),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text('Total Tagihan',
                    style: Theme.of(context).textTheme.labelSmall),
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
                  child: Text('Rp 4.000',
                      style: Theme.of(context).textTheme.labelSmall),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text('Rp 1.000',
                      style: Theme.of(context).textTheme.labelSmall),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text('Rp 40.000',
                      style: Theme.of(context).textTheme.labelSmall),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
