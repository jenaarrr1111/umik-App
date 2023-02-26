import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

import '../../../size_config.dart';
import '../../promo/promo_screen.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
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
            const DiscountBanner(),
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, SellerPromoScreenUser.routeName),
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
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

            const Categories(),
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
