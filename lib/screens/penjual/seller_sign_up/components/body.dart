// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/seller_sign_up_form.dart';
import 'package:umik/size_config.dart';

// This is the best practice

import '../../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SellerSignUpForm();
  }
}
