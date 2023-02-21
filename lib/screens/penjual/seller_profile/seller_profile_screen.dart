import 'package:flutter/material.dart';
import 'package:umik/components/coustom_bottom_nav_bar.dart';

import 'components/seller_profile_body.dart';

class SellerProfileScreen extends StatelessWidget {
  static String routeName = "/seller_profile";

  const SellerProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SellerProfileBody(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
