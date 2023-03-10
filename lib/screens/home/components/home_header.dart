import 'package:flutter/material.dart';
import 'package:umik/screens/home/components/search_field.dart';
import 'package:umik/size_config.dart';

import '../../keranjang/keranjang_screen.dart';

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
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Image.asset(
              "assets/images/umik.png",
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Lokasi Kamu",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 10,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Malang",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: SearchField(),
              ),
            ),
            // IconBtnWithCounter(
            //   svgSrc: "assets/icons/Cart Icon.svg",
            //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
            // ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, KeranjangScreen.routeName),
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
