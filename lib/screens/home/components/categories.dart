import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  _Categories createState() => _Categories();
}

class _Categories extends State<Categories> {
  List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/images/KMinuman.png",
      "title": "Minuman",
      "subtitle": "",
      "value": "1",
    },
    {
      "icon": "assets/images/KJajanan.png",
      "title": "Jajanan",
      "subtitle": "",
      "value": "2",
    },
    {
      "icon": "assets/images/KCepatsaji.png",
      "title": "Cepat saji",
      "subtitle": "",
      "value": "3",
    },
    {
      "icon": "assets/images/KNasi.png",
      "title": "Aneka nasi",
      "subtitle": "",
      "value": "4",
    },
    {
      "icon": "assets/images/KRoti.png",
      "title": "Roti",
      "subtitle": "",
      "value": "5",
    },
    {
      "icon": "assets/images/KKopi.png",
      "title": "Kopi",
      "subtitle": "",
      "value": "6",
    },
    {
      "icon": "assets/images/KSeafood.png",
      "title": "Seafood",
      "subtitle": "",
      "value": "7",
    },
    {
      "icon": "assets/images/KBakmie.png",
      "title": "Bakmie",
      "subtitle": "",
      "value": "8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["title"],
            press: () {
              // if (index == 1) Navigator.pop(context);
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
