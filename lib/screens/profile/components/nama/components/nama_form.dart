import 'package:flutter/material.dart';
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/screens/profile/components/nama/nama_screen.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class NamaForm extends StatefulWidget {
  @override
  _NamaFormState createState() => _NamaFormState();
}

class _NamaFormState extends State<NamaForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  bool remember = false;
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
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
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
      decoration: InputDecoration(
        // labelText: "Name",
        hintText: "Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }
}
