import 'package:flutter/material.dart';
import 'package:umik/screens/keranjang/components/alamat.dart';
import 'package:umik/screens/keranjang/components/bayar_form.dart';
import 'package:umik/screens/rute/rute.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../rute/rute.dart';
import 'bayar.dart';
import 'card_produk.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
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
          const Alamat(),
          SizedBox(height: getProportionateScreenHeight(20)),
          const CardProduk(),
          SizedBox(height: getProportionateScreenHeight(10)),
          const Bayar(),
          const BayarForm(),
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
              onPressed: () => {
                Navigator.pushNamed(context, UserRute.routeName),
              },
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
