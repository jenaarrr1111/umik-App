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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "UMIK",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(80)),
        const SearchField(),
        // IconBtnWithCounter(
        //   svgSrc: "assets/icons/Cart Icon.svg",
        //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
        // ),
        // IconBtnWithCounter(
        //   svgSrc: "assets/icons/Bell.svg",
        //   numOfitem: 3,
        //   press: () {},
        // ),
      ],
    );
  }
}
