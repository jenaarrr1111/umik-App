import 'package:flutter/material.dart';
import 'package:umik/components/no_account_text.dart';
import 'package:umik/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(26)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
