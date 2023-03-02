import 'package:flutter/material.dart';
import 'package:umik/models/Cart.dart';
import 'package:umik/screens/keranjang/components/custom_stepper.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CardProduk extends StatelessWidget {
  const CardProduk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: 110,
              width: 335,
              decoration: BoxDecoration(
                color: KBgColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/bakmie_ayam_suwir.png',
                          width: 80,
                          height: 64,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Pangsit Isi',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '21.000',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 10,
                            stepValue: 1,
                            iconSize: 15,
                            value: 1)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
