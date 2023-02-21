import 'package:flutter/material.dart';
import 'package:umik/screens/home/components/icon_btn_with_counter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../cart/cart_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.78,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Mau makan apa hari ini?",
            prefixIcon: Icon(Icons.search)),
      ),
      // child: IconBtnWithCounter(
      //   svgSrc: "assets/icons/Cart Icon.svg",
      //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
      // ),
    );
  }
}
