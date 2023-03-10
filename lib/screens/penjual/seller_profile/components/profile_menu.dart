import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.fieldValue = '',
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.all(20),
          // shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(child: Text(text)),
            Text(fieldValue),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu2 extends StatelessWidget {
  const ProfileMenu2({
    Key? key,
    required this.text,
    required this.fieldValue,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.all(20),
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(text),
            ),
            Text(fieldValue),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu3 extends StatelessWidget {
  const ProfileMenu3({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.all(20),
          // shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: KBgColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(child: Text(text)),
            const Icon(Icons.double_arrow_rounded),
          ],
        ),
      ),
    );
  }
}
