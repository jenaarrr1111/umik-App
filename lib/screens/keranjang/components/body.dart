import 'package:flutter/material.dart';
import 'package:umik/screens/keranjang/components/alamat.dart';
import 'package:umik/screens/keranjang/components/bayar_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'bayar.dart';
import 'card_produk.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "Keranjang Kamu",
            style: heading1Style,
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Alamat(),
          SizedBox(height: getProportionateScreenHeight(20)),
          CardProduk(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Bayar(),
          BayarForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: getProportionateScreenWidth(160),
            height: getProportionateScreenHeight(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => {},
              child: Text(
                'Order',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
