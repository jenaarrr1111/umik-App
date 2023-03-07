import 'package:flutter/material.dart';
import 'package:umik/models/Cart.dart';

import 'components/body.dart';
import 'components/struk.dart';

class StrukUmkmScreen extends StatelessWidget {
  static String routeName = "/struk_umkm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
