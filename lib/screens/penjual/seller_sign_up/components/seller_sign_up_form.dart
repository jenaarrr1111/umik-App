import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_field.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_email/seller_email_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/size_config.dart';

import '../../../../constants.dart';

class SellerSignUpForm extends StatefulWidget {
  const SellerSignUpForm({super.key});

  @override
  State<SellerSignUpForm> createState() => _SellerSignUpFormState();
}

class _SellerSignUpFormState extends State<SellerSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Column(
        children: [
          form(),
        ],
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            CustomTextField(hintText: "Nama UMKM", label: "Masukkan Nama UMKM"),
            _buildTextButton("Alamat", () {
              Navigator.pushNamed(context, SellerAddressScreen.routeName);
            }),
            _buildTextButton("Email", () {
              Navigator.pushNamed(context, SellerEmailScreen.routeName);
            }),
            CustomTextField(hintText: "", label: "Nomor Telepon"),
            CustomTextField(
                hintText: "Masukkan Plat Nomor Kendaraan",
                label: "Plat Nomor Kendaraan"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback? press) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor,
          padding: const EdgeInsets.all(30),
          // shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
