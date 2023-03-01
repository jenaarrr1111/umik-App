import 'package:flutter/material.dart';
import 'package:umik/screens/penjual/seller_sign_up/components/seller_sign_up_form.dart';

// This is the best practice

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SellerSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
