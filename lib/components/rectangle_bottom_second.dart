import 'package:flutter/material.dart';

import '../size_config.dart';

class RectangleSecond extends StatelessWidget {
  const RectangleSecond({
    Key? key,
    this.icon,
    this.text,
    this.press,
  }) : super(key: key);
  final String? icon;
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 179, 179, 179),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
