import 'package:flutter/material.dart';
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/helper/keyboard.dart';
import 'package:umik/screens/forgot_password/forgot_password_screen.dart';
import 'package:umik/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../components/second_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';
import '../../sign_up/sign_up_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
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
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(35)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kTextSecondColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(45)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Belum punya akun? ",
                style: TextStyle(fontSize: getProportionateScreenWidth(13)),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, SignUpScreen.routeName),
                child: Text(
                  "Daftar Sekarang",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      color: kPrimaryColor),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(45)),
            ],
          ),
          DefaultButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 16,
                    )),
              ),
              Text("Atau"),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 16,
                    )),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          SecondButton(
            text: "Sign In With Google",
            icon: "assets/icons/google-icon.svg",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Password",
        hintText: "Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 35.0),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Email",
        hintText: "Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 35.0),
      ),
    );
  }
}
