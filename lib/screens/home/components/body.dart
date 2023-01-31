import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              "Promo Untukmu",
              style: heading1Style,
            ),
            DiscountBanner(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Show more >>",
                style: TextStyle(
                  color: kTextSecondColor,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              "Kategori",
              textAlign: TextAlign.start,
              style: heading1Style,
            ),

            Categories(),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            // SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }
}
