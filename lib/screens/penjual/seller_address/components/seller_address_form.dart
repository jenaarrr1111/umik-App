// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:umik/components/custom_text_field.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/screens/penjual/seller_address/seller_address_screen.dart';
import 'package:umik/screens/penjual/seller_email/seller_email_screen.dart';
import 'package:umik/screens/penjual/seller_welcome/seller_welcome_screen.dart';
import 'package:umik/size_config.dart';

import '../../../../constants.dart';

class SellerAddressForm extends StatefulWidget {
  const SellerAddressForm({super.key});

  @override
  State<SellerAddressForm> createState() => _SellerAddressFormState();
}

class _SellerAddressFormState extends State<SellerAddressForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alamat Toko",
                style: TextStyle(fontSize: 16),
              )),
          form(),
        ],
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
              hintText: "", label: "Provinsi, Kota, Kecamatan, Kode Pos"),
          CustomTextField(hintText: "", label: "Nama Jalan, Gedung, No. Rumah"),
          CustomTextField(
              hintText: "",
              label: "Detail Lainnya(Cnt: Blok / Unit No, Patokan)"),
        ],
      ),
    );
  }
}
