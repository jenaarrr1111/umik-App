import 'package:flutter/material.dart';
import 'package:umik/constants.dart';
import 'package:umik/size_config.dart';

import 'sign_up_form.dart';

// padding:
//     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(45)),
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(45)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
              Text("Create Account", style: headingStyle),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SizedBox(height: getProportionateScreenHeight(100)),
            ],
          ),
        ),
      ),
    );
  }
}
