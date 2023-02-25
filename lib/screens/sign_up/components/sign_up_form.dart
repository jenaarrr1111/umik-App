import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/constants.dart';
import 'package:umik/helper/keyboard.dart';
import 'package:umik/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  bool remember = false;
  final List<String?> errors = [];

  // initialize storage
  final StorageService storage = StorageService();
  String userToken = '';

  // initialize form controller
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var namaController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> storeUserCreds(String email, String pass, String token) async {
    try {
      await storage.writeSecureData('email', email);
      await storage.writeSecureData('password', pass);
      await storage.writeSecureData('token', token);
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      // Aku bingung cara ngeblok user klo udh login, jd utk sementara aku lgsg cek klo udah ada tokennya, wkt disubmit lgsg ke home aja
      if (userToken.isNotEmpty) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
        return;
      }
      // logout dulu
      await storage.deleteAll();
      return await http.post(
        Uri.parse('http://umik.test/api/register'),
        headers: {'Accept': 'application/json'},
        body: {
          'username': usernameController.text,
          'nama': namaController.text,
          'no_tlp': phoneNumberController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      ).then((value) {
        final data = jsonDecode(value.body);
        print(data);
        print(data['token']);
        storeUserCreds(
            emailController.text, passwordController.text, data['token']);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //Username
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          //Name
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          //Email
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          //No Tlp
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          //Password
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          // form Error
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          //Button Sign Up
          DefaultButton(
            text: "Sign Up",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _onSubmit();
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          //Sign Up With Google
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 16,
                    )),
              ),
              const Text("Atau"),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 16,
                    )),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          SecondButton(
            icon: "assets/icons/google-icon.svg",
            text: "Sign Up With Google",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  //field Username
  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: usernameController,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  //field Name
  TextFormField buildNameFormField() {
    return TextFormField(
      controller: namaController,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  //field Password
  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
      decoration: const InputDecoration(
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  //field Email
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
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
      decoration: const InputDecoration(
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: phoneNumberController,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      ),
    );
  }
}
