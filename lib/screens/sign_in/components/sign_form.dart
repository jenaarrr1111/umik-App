import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/components/second_button.dart';
import 'package:umik/constants.dart';
import 'package:umik/helper/keyboard.dart';
import 'package:umik/screens/forgot_password/forgot_password_screen.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/sign_up/sign_up_screen.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  // initialize storage
  final StorageService storage = StorageService();
  String userToken = '';

  // initialize form controller
  var emailController = TextEditingController();
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
      final String email = await storage.readSecureData('email') ?? '';
      final String password = await storage.readSecureData('password') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      final Map allData = await storage.readAll();
      print('all: $allData');
      setState(() {
        emailController.text = email;
        passwordController.text = password;
        userToken = token;
      });
    } catch (e) {
      print(e);
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
      return await http.post(
        Uri.parse('http://umik.test/api/login'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: {
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
          //Email
          // buildEmailFormField(),

          // [ Email ]
          TextFormField(
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 35.0),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(35)),

          //Password
          // buildPasswordFormField(),

          // [ Password ]
          TextFormField(
            controller: passwordController,
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return;
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 35.0),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),

          Row(
            children: [
              //Lupa Password
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Lupa Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kTextSecondColor,
                  ),
                ),
              )
            ],
          ),

          //Form Error
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

          //Button Sign in
          DefaultButton(
            text: "Sign In",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                _onSubmit();
                // final StorageItem newItem = await _secureStorage.writeSecureData(newItem);

                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),

          //Sign in With google
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
            text: "Sign In With Google",
            icon: "assets/icons/google-icon.svg",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
