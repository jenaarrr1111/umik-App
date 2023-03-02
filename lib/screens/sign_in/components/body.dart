import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/screens/sign_in/components/sign_in_form.dart';
import 'package:umik/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(45)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text("Sign In", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.09),
                const SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SizedBox(height: getProportionateScreenHeight(100)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
