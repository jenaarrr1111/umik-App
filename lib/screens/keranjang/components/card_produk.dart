import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/keranjang/components/custom_stepper.dart';
import 'package:umik/size_config.dart';

// https://stackoverflow.com/questions/49824461/how-to-pass-data-from-child-widget-to-its-parent
typedef JumlahProdukCallback = void Function(int jmlProduk);

class CardProduk extends StatefulWidget {
  int jmlProduk;
  final int hargaProduk;
  final int stokProduk;
  final String namaProduk;
  final String imagePath;
  final JumlahProdukCallback setJumlahProduk;

  CardProduk({
    Key? key,
    required this.jmlProduk,
    required this.hargaProduk,
    required this.namaProduk,
    required this.imagePath,
    required this.stokProduk,
    required this.setJumlahProduk,
  }) : super(key: key);

  @override
  State<CardProduk> createState() => _CardProdukState();
}

class _CardProdukState extends State<CardProduk> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              color: KBgColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Image(
                        image:
                            NetworkImage('$kPublicStorage/${widget.imagePath}'),
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Image(
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
                              widget.namaProduk,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              fmtHarga.format(widget.hargaProduk),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      /* child: CustomStepper(
                        lowerLimit: 1,
                        upperLimit: widget.stokProduk,
                        stepValue: 1,
                        iconSize: 15,
                        value: widget.jmlProduk,
                      ), */
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundedIconButton(
                            icon: Icons.remove,
                            iconSize: 15,
                            onPress: () {
                              const lowerLimit = 1;
                              const stepValue = 1;
                              setState(() {
                                if (widget.jmlProduk == lowerLimit) {
                                  return;
                                }
                                widget.jmlProduk -= stepValue;
                                /* widget.value = widget.value == widget.lowerLimit
                                widget.value = widget.value == widget.lowerLimit
                                    ? widget.lowerLimit
                                    : widget.value -= widget.stepValue; */
                              });
                              widget.setJumlahProduk(widget.jmlProduk);
                            },
                          ),
                          Text(
                            widget.jmlProduk.toString(),
                            style: const TextStyle(
                              fontSize: 15 * 0.8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          RoundedIconButton(
                            icon: Icons.add,
                            iconSize: 15,
                            onPress: () {
                              final upperLimit = widget.stokProduk;
                              const stepValue = 1;
                              setState(() {
                                if (widget.jmlProduk == upperLimit) {
                                  return;
                                }
                                widget.jmlProduk += stepValue;
                                /* widget.value = widget.value == widget.upperLimit
                                    ? widget.upperLimit
                                    : widget.value += widget.stepValue; */
                              });
                              widget.setJumlahProduk(widget.jmlProduk);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
