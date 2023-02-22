import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              "assets/images/umik.png",
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(80)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SearchField(),
            // const Align(
            //   alignment: Alignment.centerLeft,
            // child: Padding(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: const SearchField(),
            // ),
            // ),
            // IconBtnWithCounter(
            //   svgSrc: "assets/icons/Cart Icon.svg",
            //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
            // ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CartScreen.routeName),
              icon: Image.asset(
                "assets/images/Keranjang.png",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
