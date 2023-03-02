import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText, label;
  final TextEditingController inputController;

  const CustomTextField({
    Key? key,
    this.hintText = '',
    required this.label,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: KBgColor,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: (hintText == "") ? label : hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}
