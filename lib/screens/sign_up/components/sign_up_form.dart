import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/constants.dart';
import 'package:http/http.dart' as http;
import 'package:umik/screens/sign_in/sign_in_screen.dart';
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
  var noTelpController = TextEditingController();
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

  Future<void> getUserCreds() async {
    try {
      final String token = await storage.readSecureData('token') ?? '';
      setState(() => userToken = token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeUserCreds(
    String email,
    String pass,
  ) async {
    try {
      await storage.writeSecureData('email', email);
      await storage.writeSecureData('password', pass);
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var url = '$kApiBaseUrl/register';

      return await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: {
          'username': usernameController.text,
          'nama': namaController.text,
          'no_tlp': noTelpController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      ).then((value) {
        final res = jsonDecode(value.body);
        final resMsg = res['message'];

        // klo udh login / ter-autentikasi
        if (value.statusCode == 403 && userToken.isNotEmpty) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
          return;
        }

        if (value.statusCode != 201) {
          if (resMsg is String) {
            addError(error: resMsg);
            return;
          }

          if (resMsg.runtimeType.toString() == '_JsonMap') {
            for (var item in resMsg.values) {
              addError(error: item[0]);
            }
          }
          return;
        }

        storeUserCreds(
          emailController.text,
          passwordController.text,
        ).then((value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              SignInScreen.routeName, (Route<dynamic> route) => false);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserCreds();
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
      controller: noTelpController,
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
