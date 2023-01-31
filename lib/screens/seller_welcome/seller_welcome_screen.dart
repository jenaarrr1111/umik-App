import 'package:flutter/material.dart';
import 'package:umik/screens/seller_welcome/components/body.dart';
import 'package:umik/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/seller_welcome";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
