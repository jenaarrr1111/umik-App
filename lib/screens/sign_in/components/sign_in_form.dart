import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umik/components/custom_surfix_icon.dart';
import 'package:umik/components/default_button.dart';
import 'package:umik/components/form_error.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/forgot_password/forgot_password_screen.dart';
import 'package:umik/screens/home/home_screen.dart';
import 'package:umik/screens/sign_up/sign_up_screen.dart';
import 'package:umik/services/storage_service.dart';
import 'package:umik/size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;
  final List<String?> errors = [];

  // initialize storage
  final StorageService storage = StorageService();
  String userToken = '';

  // initialize form controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Err related
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

  // future and api calls
  Future<void> getUserCreds() async {
    try {
      final String email = await storage.readSecureData('email') ?? '';
      final String password = await storage.readSecureData('password') ?? '';
      final String token = await storage.readSecureData('token') ?? '';
      setState(() {
        emailController.text = email;
        passwordController.text = password;
        userToken = token;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeUserCreds(
    String email,
    String pass,
    String token,
    int userId,
    String lvlUser,
  ) async {
    try {
      await storage.writeSecureData('email', email);
      await storage.writeSecureData('password', pass);
      await storage.writeSecureData('token', token);
      // dipake utk daftar sbg umkm
      await storage.writeSecureData('user_id', userId.toString());
      await storage.writeSecureData('level_user', lvlUser);
    } catch (e) {
      print(e);
    }
  }

  Future _onSubmit() async {
    try {
      var url = '$kApiBaseUrl/login';
      return await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: {
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

        if (value.statusCode != 200) {
          if (resMsg is String) {
            addError(error: resMsg);
            return;
          }

          if (resMsg.runtimeType.toString() == '_JsonMap') {
            for (var item in resMsg.values) {
              addError(error: item[0]);
            }
            return;
          }
        }

        // definisikan userId harus stlhnya kondisi error soalnya klo error ga addres['data']['id']
        final resToken = res['token'];
        final userId = res['data']['id'];
        final levelUser = res['data']['level_user'];
        storeUserCreds(
          emailController.text,
          passwordController.text,
          resToken,
          userId,
          levelUser,
        ).then((value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.routeName, (Route<dynamic> route) => false);
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

                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
