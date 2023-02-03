// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/form_error.dart';

import '../../../../components/second_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class SellerSignUpForm extends StatefulWidget {
  @override
  _SellerSignUpFormState createState() => _SellerSignUpFormState();
}

class _SellerSignUpFormState extends State<SellerSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? umkm_name;
  // Array? address;
  String? email;
  String? phone_number;
  String? number_plate;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildUmkmNameField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildNumberPlateFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Row(
            children: <Widget>[
              Flexible(
                child: SecondButton(
                  text: "Kembali",
                  press: () {},
                ),
              ),
              Flexible(
                child: DefaultButton(
                  text: "Kirim",
                  press: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

  TextFormField buildUmkmNameField() {
    return TextFormField(
      onSaved: (newValue) => umkm_name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Nama Umkm",
        hintText: "Masukkan Nama UMKM",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onTap: () {},
      decoration: InputDecoration(
        labelText: "Alamat",
        // hintText: "Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/arrow_right.svg"),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onTap: () {},
      decoration: InputDecoration(
        labelText: "Email",
        // hintText: "Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/arrow_right.svg"),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => phone_number = newValue,
      onChanged: (value) {
        (value.isNotEmpty)
            ? removeError(error: kPhoneNumberNullError)
            : phone_number = value;
      },
      validator: (value) {
        (value!.isEmpty) ? addError(error: kPhoneNumberNullError) : null;
      },
      decoration: InputDecoration(
        labelText: "Nomor Telepon",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  TextFormField buildNumberPlateFormField() {
    return TextFormField(
      onSaved: (newValue) => number_plate = newValue,
      onChanged: (value) {
        (value.isNotEmpty)
            ? removeError(error: kNamelNullError)
            : number_plate = value;
      },
      validator: (value) {
        (value!.isEmpty) ? addError(error: kNamelNullError) : null;
      },
      decoration: InputDecoration(
        labelText: "Plat Nomor Kendaraan",
        hintText: "Masukkan Plat Nomor Kendaraan",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }
}
