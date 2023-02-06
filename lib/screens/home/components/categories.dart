import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/images/KMinuman.png",
        "text": "Minuman",
        "value": '1',
      },
      {
        "icon": "assets/images/KJajanan.png",
        "text": "Jajanan",
        "value": '2',
      },
      {
        "icon": "assets/images/KCepatsaji.png",
        "text": "Cepat saji",
        "value": '3',
      },
      {
        "icon": "assets/images/KNasi.png",
        "text": "Aneka nasi",
        "value": '4',
      },
      {
        "icon": "assets/images/KRoti.png",
        "text": "Roti",
        "value": '5',
      },
      {
        "icon": "assets/images/KKopi.png",
        "text": "Kopi",
        "value": '6',
      },
      {
        "icon": "assets/images/KSeafood.png",
        "text": "Seafood",
        "value": '7',
      },
      {
        "icon": "assets/images/KBakmie.png",
        "text": "Bakmie",
        "value": '8',
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              // Navigator( )
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(80),
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(49),
              width: getProportionateScreenWidth(52),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon!),
            ),
            SizedBox(height: 7),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
