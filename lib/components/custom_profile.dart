import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class CustomProfile extends StatelessWidget {
  final String hintText, label;

  const CustomProfile({
    Key? key,
    this.hintText = "",
    required this.label,
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
          contentPadding: const EdgeInsets.all(30),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}
