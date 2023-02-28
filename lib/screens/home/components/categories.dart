import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/constants.dart';
import 'package:umik/size_config.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Map<String, String> imgPath = {
    'Minuman': "assets/images/KMinuman.png",
    'Jajanan': "assets/images/KJajanan.png",
    'Cepat Saji': "assets/images/KCepatsaji.png",
    'Aneka Nasi': "assets/images/KNasi.png",
    'Roti': "assets/images/KRoti.png",
    'Kopi': "assets/images/KKopi.png",
    'Seafood': "assets/images/KSeafood.png",
    'Bakmie': "assets/images/KBakmie.png",
  };

  List<dynamic> _getCategories = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      var url = '$kApiBaseUrl/categories';
      final response = await http.get(Uri.parse(url));

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _getCategories = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_getCategories.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
          _getCategories.length,
          (index) {
            return CategoryCard(
              icon: imgPath[_getCategories[index]],
              text: _getCategories[index],
              press: () {
                Navigator.pushNamed(context, '/daftar_umkm', arguments: {
                  'title': _getCategories[index],
                });
              },
            );
          },
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
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon!),
            ),
            const SizedBox(height: 7),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
