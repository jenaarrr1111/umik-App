import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/keranjang/components/custom_stepper.dart';
import 'package:umik/size_config.dart';

class CardProduk extends StatelessWidget {
  final int jmlProduk;
  final int hargaProduk;
  final int stokProduk;
  final String namaProduk;
  final String imagePath;
  const CardProduk({
    Key? key,
    required this.jmlProduk,
    required this.hargaProduk,
    required this.namaProduk,
    required this.imagePath,
    required this.stokProduk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: KBgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Image(
                          // width: 50,
                          image: NetworkImage('$kPublicStorage/$imagePath'),
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const Image(
                              // width: 50,
                              image: AssetImage(
                                  'assets/images/bakmie_ayam_suwir.png'),
                              fit: BoxFit.fitHeight,
                            );
                          },
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                namaProduk,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                fmtHarga.format(hargaProduk),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomStepper(
                          lowerLimit: 1,
                          upperLimit: stokProduk,
                          stepValue: 1,
                          iconSize: 15,
                          value: jmlProduk,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
