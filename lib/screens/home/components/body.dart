import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../../size_config.dart';
import '../../promo/promo_screen.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Promo Untukmu",
                  style: heading1Style,
                  // textAlign: TextAlign.left,
                ),
              ),
            ),
            DiscountBanner(),
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, SellerPromoScreenUser.routeName),
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Show more >>",
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Kategori",
                  textAlign: TextAlign.start,
                  style: heading1Style,
                ),
              ),
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
